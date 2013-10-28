# Usage: bagit nameofbagfolder nameoffoldertobebagged
# Make the bag and data directory 
mkdir $1 
mkdir $1/data 
echo "Created $1 bag" 
# Copy chosen directory to the data directory 
echo "Copying data into bag" 
cp -r $2 $1/data
# Make the manifest file from the directory pointed at 
echo "Creating md5 manifest" 
find "$PWD"/$1 -type f -print0 | xargs -0 gmd5sum > $1/manifest-md5.txt
# Make the bagit text file 
touch $1/bagit.txt
echo "BagIt-version 0.98" > $1/bagit.txt
echo "Tag-File-Character-Encoding: UTF-8" > $1/bagit.txt
