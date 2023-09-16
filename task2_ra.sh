echo>network_stats.txt

for ir in $(seq 0.01 0.01 1);
do
    echo >>network_stats.txt
    echo "ra:Torus,ir:$ir" >> network_stats.txt
    ./build/NULL/gem5.opt configs/example/garnet_synth_traffic.py --network=garnet --num-cpus=64 --num-dirs=64 --topology=Torus --mesh-rows=8 --inj-vnet=0 --synthetic=uniform_random --sim-cycles=10000 --injectionrate=$ir --routing-algorithm=3
    grep "packets_injected::total" m5out/stats.txt | sed 's/system.ruby.network.packets_injected::total\s*/packets_injected = /' >> network_stats.txt
    grep "packets_received::total" m5out/stats.txt | sed 's/system.ruby.network.packets_received::total\s*/packets_received = /' >> network_stats.txt
    grep "average_packet_queueing_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_queueing_latency\s*/average_packet_queueing_latency = /' >> network_stats.txt
    grep "average_packet_network_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_network_latency\s*/average_packet_network_latency = /' >> network_stats.txt
    grep "average_packet_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_latency\s*/average_packet_latency = /' >> network_stats.txt
    grep "average_hops" m5out/stats.txt | sed 's/system.ruby.network.average_hops\s*/average_hops = /' >> network_stats.txt
done

for ir in $(seq 0.01 0.01 1);
do
    echo >>network_stats.txt
    echo "ra:xy,ir:$ir" >> network_stats.txt
    ./build/NULL/gem5.opt configs/example/garnet_synth_traffic.py --network=garnet --num-cpus=64 --num-dirs=64 --topology=Mesh_XY --mesh-rows=8 --inj-vnet=0 --synthetic=uniform_random --sim-cycles=10000 --injectionrate=$ir --routing-algorithm=1
    grep "packets_injected::total" m5out/stats.txt | sed 's/system.ruby.network.packets_injected::total\s*/packets_injected = /' >> network_stats.txt
    grep "packets_received::total" m5out/stats.txt | sed 's/system.ruby.network.packets_received::total\s*/packets_received = /' >> network_stats.txt
    grep "average_packet_queueing_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_queueing_latency\s*/average_packet_queueing_latency = /' >> network_stats.txt
    grep "average_packet_network_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_network_latency\s*/average_packet_network_latency = /' >> network_stats.txt
    grep "average_packet_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_latency\s*/average_packet_latency = /' >> network_stats.txt
    grep "average_hops" m5out/stats.txt | sed 's/system.ruby.network.average_hops\s*/average_hops = /' >> network_stats.txt
done

for ir in $(seq 0.01 0.01 1);
do
    echo >>network_stats.txt
    echo "ra:Full,ir:$ir" >> network_stats.txt
    ./build/NULL/gem5.opt configs/example/garnet_synth_traffic.py --network=garnet --num-cpus=64 --num-dirs=64 --topology=Mesh_Full --mesh-rows=8 --inj-vnet=0 --synthetic=uniform_random --sim-cycles=10000 --injectionrate=$ir --routing-algorithm=2
    grep "packets_injected::total" m5out/stats.txt | sed 's/system.ruby.network.packets_injected::total\s*/packets_injected = /' >> network_stats.txt
    grep "packets_received::total" m5out/stats.txt | sed 's/system.ruby.network.packets_received::total\s*/packets_received = /' >> network_stats.txt
    grep "average_packet_queueing_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_queueing_latency\s*/average_packet_queueing_latency = /' >> network_stats.txt
    grep "average_packet_network_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_network_latency\s*/average_packet_network_latency = /' >> network_stats.txt
    grep "average_packet_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_latency\s*/average_packet_latency = /' >> network_stats.txt
    grep "average_hops" m5out/stats.txt | sed 's/system.ruby.network.average_hops\s*/average_hops = /' >> network_stats.txt
done