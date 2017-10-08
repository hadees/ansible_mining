#!/bin/bash

# {{ ansible_managed }}

{% set mining_xmr_cores = (ansible_processor_count|int * ansible_processor_cores|int) - mining_bcn_cores|int - mining_free_cpu_cores|int %}
# ansible processor count: {{ ansible_processor_count }}
# ansible processor cores: {{ ansible_processor_cores }}
# bcn cores: {{ mining_bcn_cores }}
# free cores {{ mining_free_cpu_cores }}
# xmr cores (calculated): {{ mining_xmr_cores }}


/usr/bin/minergate-cli -user {{ mining_address_email }} \
    {% if mining_bcn_cores > 0 %}-bcn {{ mining_bcn_cores }}{% endif %} \
    {% if mining_xmr_cores > 0 %}-xmr {{ mining_xmr_cores }}{% endif %}
