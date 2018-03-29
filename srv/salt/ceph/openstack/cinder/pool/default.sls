{% set prefix = pillar['openstack_prefix'] + "-" if 'openstack_prefix' in pillar else "" %}
{{ prefix }}cinder pool:
  cmd.run:
    - name: "ceph osd pool create {{ prefix }}volumes 128"
    - unless: "ceph osd pool ls | grep -q '^{{ prefix }}volumes$'"
    - fire_event: True

