

ids=$(porchctl rpkg get | grep sdcore4g-operator | grep regional | awk '{ print $1}')

del_ids=""
while IFS= read -r line ;
do
    echo "line : $line"
    del_ids+=" $line"
done < <(echo $ids)

echo "result : $del_ids"

#
porchctl rpkg propose-delete -n default $del_ids

sleep 2

porchctl rpkg delete -n default $del_ids
