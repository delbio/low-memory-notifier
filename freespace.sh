
# nel Mac le funzioni funzionano senza () non so se continuano a funzionare con le ()
# ubuntu esegue questo script con bash e non con sh come mac

function usages() {
    error_message=$1
    echo "ERROR: "${error_message} 
    echo
    echo "USAGE: bash "${0}" file-system-name [down-limit-mb]"
    echo
    echo "USAGE: df | awk '{print \$1}' for list of available file system names:"
    echo "File system names founded: "$(df | awk '{print $1}')
    echo "Mount Point founded: "$(df | awk '{print $6}')
}

function getLastFSName() {

    file_system_name=${1}
    founded=0

    for partition in $(df | awk '{print $1}')
    do
        #echo ${partition}" contain: "${file_system_name}
        
        if [[ $partition == *${file_system_name}* ]]
        then
            #echo "trovato un contain ;)"
            metab=1
            founded=$(( $founded + $metab ))
        fi
    done
}

function validateFileSystemName() {

    file_system_name=${1}
    echo "Is "${file_system_name}" a real parition name ..."

    founded=$(df -k | grep ${file_system_name} | wc -l)

    echo "match founded: "${founded}

    if [ ${founded} -le 0 ]
    then 
        usages ${file_system_name}" is not mached."
        exit
    else
        if [ ${founded} -eq 1 ]
        then
            echo "Rilevazione spazio libero nel file system: "${file_system_name}"* ... "$(df -k | grep ${file_system_name} | awk '{print $4/1024}')" MB"
        else
            usages "More than one Filesysten match with selected pattern, raffine your pattern."
            exit
        fi
    fi
}

file_system_name=""
limite=3072

## -- VALIDAZIONE ARGOMENTI

if [ -n "$1" ]
then
    validateFileSystemName $1
    file_system_name=$1
else
    usages "No File system Name founded !!!"
    exit
fi

if [ -n "$2" ]
then
    echo "limite inferiore scelto: "${limite}" MB"
    limite=$2
else
    echo "limite non impostato, default: "${limite}" MB"
fi

#echo $(df -k | grep ${file_system_name} | awk '{print $4}')" KB"
#echo $(df -k | grep ${file_system_name} | awk '{print $4/1024}')" MB"
#echo "riassunto parametri: fs = "${file_system_name}" limite = "${limite}

## -- ESECUZIONE

free_space=$(df -k | grep ${file_system_name} | awk '{print $4/1024}')

if [ ${free_space} -le ${limite} ]
then
  echo "spazio sotto la soglia, manda un email al gestore ..."
else
  echo "spazio sotto controllo, chiudo."
fi


