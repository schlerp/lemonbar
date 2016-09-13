#!/bin/bash

# source config
. $(dirname $0)/../i3_lemonbar_config

case $1 in
    wifi*)
        data=`conky -c $(dirname $0)/lb_wifi_conky -i 1`
        data_arr=(${data#????})
        ssid=${data_arr[0]}
        dl_speed=${data_arr[1]}
        ul_speed=${data_arr[2]}
        title="<span font='${font_icon_notify} 42'>${icon_wifi_con}</span><span font='${font_notify} 42'> ${ssid}</span>"
        body="<span font='${font_icon_notify} 36'>${icon_dl}</span><span font='${font_notify} 32'>: ${dl_speed}</span>
<span font='${font_icon_notify} 36'>${icon_ul}</span><span font='${font_notify} 32'>: ${ul_speed}</span>"
        notify-send -u low "$title" "$body"
        ;;
    disk*)
        data=`conky -c $(dirname $0)/lb_disk_conky -i 1`
        data_arr=(${data#????})
        root_perc=${data_arr[0]}
        home_perc=${data_arr[1]}
        title="<span font='${font_icon_notify} 42'>${icon_hd}</span><span font='${font_notify} 42'> disk</span>"
        body="<span font='${font_icon_notify} 36'>${icon_hd}</span><span font='${font_notify} 32'>: ${root_perc}%</span>
<span font='${font_icon_notify} 36'>${icon_home}</span><span font='${font_notify} 32'>: ${home_perc}%</span>"
        notify-send -u low "$title" "$body"
        ;;
    mem*)
        data=`conky -c $(dirname $0)/lb_mem_conky -i 1`
        data_arr=(${data})
        mem=${data_arr[1]}
        mem_max=${data_arr[2]}
        swap=${data_arr[3]}
        swap_max=${data_arr[4]}
        title="<span font='${font_icon_notify} 42'>${icon_mem_title}</span><span font='${font_notify} 42'> memory</span>"
        body="<span font='${font_notify} 32'>ram: ${mem} of ${mem_max}</span>
<span font='${font_notify} 32'>swap: ${swap} of ${swap_max}</span>"
        notify-send -u normal "$title" "$body"
        ;;
    task*)
        data=`conky -c $(dirname $0)/lb_task_conky -i 1`
        data_arr=(${data})
        top_1_pid=${data_arr[1]}
        top_1_name=${data_arr[2]}
        top_1_cpu=${data_arr[3]}
        top_2_pid=${data_arr[4]}
        top_2_name=${data_arr[5]}
        top_2_cpu=${data_arr[6]}
        top_3_pid=${data_arr[7]}
        top_3_name=${data_arr[8]}
        top_3_cpu=${data_arr[9]}
        top_mem_1_pid=${data_arr[10]}
        top_mem_1_name=${data_arr[11]}
        top_mem_1_mem=${data_arr[12]}
        top_mem_2_pid=${data_arr[13]}
        top_mem_2_name=${data_arr[14]}
        top_mem_2_mem=${data_arr[15]}
        top_mem_3_pid=${data_arr[16]}
        top_mem_3_name=${data_arr[17]}
        top_mem_3_mem=${data_arr[18]}
        
        title="<span font='${font_icon_notify} 42'>${icon_task}</span><span font='${font_notify} 42'> tasks</span>"
        body="<span font='${font_notify} 32'><u>top cpu</u></span>
<span font='${font_notify} 32'>${top_1_pid} | ${top_1_name} | ${top_1_cpu}%</span>
<span font='${font_notify} 32'>${top_2_pid} | ${top_2_name} | ${top_2_cpu}%</span>
<span font='${font_notify} 32'>${top_3_pid} | ${top_3_name} | ${top_3_cpu}%</span>

<span font='${font_notify} 32'><u>top memory</u></span>
<span font='${font_notify} 32'>${top_mem_1_pid} | ${top_mem_1_name} | ${top_mem_1_mem}</span>
<span font='${font_notify} 32'>${top_mem_2_pid} | ${top_mem_2_name} | ${top_mem_2_mem}</span>
<span font='${font_notify} 32'>${top_mem_3_pid} | ${top_mem_3_name} | ${top_mem_3_mem}</span>"
        
        notify-send -u normal "$title" "$body"
        ;;
    cpu*)
        data=`conky -c $(dirname $0)/lb_sys_conky -i 1`
        data_arr=(${data})
        cpu_tot=${data_arr[1]}
        cpu_1_perc=${data_arr[2]}
        cpu_1_freq=${data_arr[3]}
        cpu_2_perc=${data_arr[4]}
        cpu_2_freq=${data_arr[5]}
        cpu_3_perc=${data_arr[6]}
        cpu_3_freq=${data_arr[7]}
        cpu_4_perc=${data_arr[8]}
        cpu_4_freq=${data_arr[9]}
        cpu_5_perc=${data_arr[10]}
        cpu_5_freq=${data_arr[11]}
        cpu_6_perc=${data_arr[12]}
        cpu_6_freq=${data_arr[13]}
        cpu_7_perc=${data_arr[14]}
        cpu_7_freq=${data_arr[15]}
        cpu_8_perc=${data_arr[16]}
        cpu_8_freq=${data_arr[17]}
                
        title="<span font='${font_icon_notify} 42'>${icon_cpu}</span><span font='${font_notify} 42'> system</span>"
        body="<span font='${font_notify} 32'>cpu total: ${cpu_tot}%</span>
<span font='${font_notify} 32'>1: ${cpu_1_perc}% at ${cpu_1_freq}GHz</span>
<span font='${font_notify} 32'>2: ${cpu_2_perc}% at ${cpu_2_freq}GHz</span>
<span font='${font_notify} 32'>3: ${cpu_3_perc}% at ${cpu_3_freq}GHz</span>
<span font='${font_notify} 32'>4: ${cpu_4_perc}% at ${cpu_4_freq}GHz</span>
<span font='${font_notify} 32'>5: ${cpu_5_perc}% at ${cpu_5_freq}GHz</span>
<span font='${font_notify} 32'>6: ${cpu_6_perc}% at ${cpu_6_freq}GHz</span>
<span font='${font_notify} 32'>7: ${cpu_7_perc}% at ${cpu_7_freq}GHz</span>
<span font='${font_notify} 32'>8: ${cpu_8_perc}% at ${cpu_8_freq}GHz</span>"
        notify-send -u normal "$title" "$body"
        ;;
    dat*)
        data=`cal -m`
        data_arr=(${data})
        title="<span font='${font_icon_notify} 42'>${icon_calendar}</span><span font='${font_notify} 42'> Calendar</span>"
        body="<span font='${font_notify} 32'>${data}</span>"
        notify-send -u normal "$title" "$body"
        ;;
esac
