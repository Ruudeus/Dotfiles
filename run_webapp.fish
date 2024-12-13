function run_webapp
    argparse lan android_device ios ios_device android_ios_device -- $argv
    if set -ql _flag_lan
        echo "meteor --settings=settings.json --port=http://$(ipconfig getifaddr en0):3000"
        meteor --settings=settings.json --port=http://$(ipconfig getifaddr en0):3000
    else if set -ql _flag_android_device
        set -l devices "$(nu -c 'adb devices | rg "device\$" | str trim | split row "\n" | split column "\t"| get column1 | compact --empty| if (($in | length) == 0) {""} else {$in | table -i 1}')"
        if test -z $devices
            adb-qc
        else
            echo "List of connected devices - "\n"$devices"
            echo "Do you still want to pair device ? (y/n)"
            read -l redo
            if test $redo = y
                adb-qc
            end
        end
        set -l ip $(ipconfig getifaddr en0)
        echo "meteor run android-device --settings=settings.json --mobile-server=http://$ip:3000"
        meteor run android-device --settings=settings.json --mobile-server=http://$ip:3000
    else if set -ql _flag_ios
        echo "meteor run ios --settings=settings.json --mobile-server=http://$ip:3000"
        meteor run ios --settings=settings.json --mobile-server=http://$ip:3000
    else if set -ql _flag_ios_device
        echo "meteor run ios-device android-device --settings=settings.json --mobile-server=http://$ip:3000"
        meteor run ios-device --settings=settings.json --mobile-server=http://$ip:3000
    else if set -ql _flag_android_ios_device
        echo "meteor run ios-device android-device --settings=settings.json --mobile-server=http://$ip:3000"
        meteor run ios-device android-device --settings=settings.json --mobile-server=http://$ip:3000
    else
        echo "meteor --settings=settings.json"
        meteor --settings=settings.json
    end
end
