#!/bin/bash

# {{ ansible_managed }}

/usr/bin/minergate-cli -user {{ mining_address_email }} \
    -bcn {{ mining_bcn_cores }} \
    -xmr $((`nproc`-{{ mining_bcn_cores }}-{{ mining_free_cpu_cores }}))
