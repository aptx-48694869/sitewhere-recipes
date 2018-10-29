{{- define "sitewhere.microserviceEnvValues" }}
- name: "sitewhere.k8s.pod.ip"
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
- name: "sitewhere.zookeeper.host"
  value: "{{ include "sitewhere.fullname" . }}-zookeeper-svc"
- name: "sitewhere.tracer.server"
  value: "{{ include "sitewhere.fullname" . }}-jaeger-svc"
- name: "sitewhere.kafka.bootstrap.servers"
  value: "{{ include "sitewhere.fullname" . }}-kafka-svc:{{ .Values.infra.kafka.service.inside.port }}"
- name: "mqtt.host"
  value: "{{ include "sitewhere.fullname" . }}-mosquitto-svc"
- name: "mongodb.host"
  value: "{{ include "sitewhere.fullname" . }}-mongodb-svc"
- name: "sitewhere.consul.host"
  value: "{{ include "sitewhere.fullname" . }}-consul-server"
- name: "sitewhere.consul.port"
  value: "8500"
{{- end }}