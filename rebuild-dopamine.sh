if [[ $1 ]]
then
	rpm=$1
	echo $rpm
	build_number_match='Dopamine-3\.[0-9]\.[0-9]-(.*)\.rpm'
	if [[ $rpm =~ $build_number_match ]];
	then
		build_number=${BASH_REMATCH[1]}
		echo $build_number
	else
		echo "no build number"
		exit
	fi
	rpmrebuild --change-spec-requires='sed "s/Requires:      libuuid/Requires:      libuuid1/g"' -np -d . -r $build_number $rpm
else
	echo "rpm file required"
	exit
fi
