# extract all packages specified in the requirements.txt file
while read package version; do
	if [ -z $version ]; then
		Rscript -e "devtools::install_version('"$package"', quiet=TRUE)";
	else
		Rscript -e "devtools::install_version('"$package"', '"$version"', quiet=TRUE)";
	fi;
done < "/tmp/r-tmp/requirements.txt"
