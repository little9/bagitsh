# Usage: bagitsha nameofbagfolder nameoffoldertobebagged
# Make the bag and data directory



command -v sha1sum >/dev/null 2>&1 || {
    echo "This script requires sha1sum but it's not installed." >&2; exit 1;
}


if [ "$1" = "" ]
then
    echo "Please specify a bag name"
    exit
fi

if [ "$2" = "" ]
then
    echo "Please specify a directory to bag "
    exit
fi


mkdir $1
mkdir $1/data
echo "Created $1 bag"
# Copy chosen directory to the data directory
echo "Copying data into bag..."
cp -r $2 $1/data
# Make the manifest file from the directory pointed at
echo "Creating sha1 manifest"
find "$PWD"/$1/data -type f -print0 | xargs -0 sha1sum > $1/manifest-sha1.txt
# Make the bagit text file
touch $1/bagit.txt
echo "BagIt-version 0.98" > $1/bagit.txt
echo "Tag-File-Character-Encoding: UTF-8" >> $1/bagit.txt

