# extract all packages specified in the requirements.txt file
while read package version; do
	if [ -z $version ]; then
		Rscript -e "devtools::install_version('"$package"')";
	else
		Rscript -e "devtools::install_version('"$package"', '"$version"')";
	fi;
done < "/tmp/r-tmp/requirements.txt"
