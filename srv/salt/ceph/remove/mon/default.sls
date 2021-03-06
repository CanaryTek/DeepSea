
remove mon nop:
  test.nop

{% for minion in salt['mon.list']() %}
{% if minion not in salt.saltutil.runner('select.minions', cluster='ceph', roles='mon', host=True) %}
remove mon.{{ minion }}:
  cmd.run:
    - name: "ceph mon remove {{ minion }} || :"
{% endif %}
{% endfor %}

/var/cache/salt/master/jobs:
  file.directory:
    - user: {{ salt['deepsea.user']() }}
    - group: {{ salt['deepsea.group']() }}
    - recurse:
      - user
      - group

