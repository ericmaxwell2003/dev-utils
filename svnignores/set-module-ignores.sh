if [ "$#" -eq 0 ]; then 
  echo "Usage: sh set-module-ignores.sh ignore-file.txt"; 
  exit 1 
fi

echo "Setting up svn ignores for maven modules"

files="$(find -L -name "pom.xml")"
echo "Count: $(echo -n "$files" | wc -l)"
echo "$files" | while read file; do
  dir="$(dirname $file)"
  echo "$(svn propset svn:ignore --file $1 $dir)"
done
