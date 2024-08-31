# my_module_dir variable define in puppet script

generate_manifest()
{

cat <<EOF
	include php
EOF

}

generate_hieradata()
{
	local my_common_yaml="${my_module_dir}/common.yaml"
	local _val _tpl

	if [ -f "${my_common_yaml}" ]; then
		local tmp_common_yaml=$( mktemp )
		trap "/bin/rm -f ${tmp_common_yaml}" HUP INT ABRT BUS TERM EXIT
		/bin/cp ${my_common_yaml} ${tmp_common_yaml}
		for i in ${param}; do
			eval _val=\${${i}}
			_tpl="#${i}#"
			case "${i}" in
				php_version)
					package_prefix_ver=$( echo $php_version | tr -d "\." )
					# package_prefix_ver depends on php_version
					sed -i '' -Ees:#package_prefix_ver#:${package_prefix_ver}:g ${tmp_common_yaml}
					;;
				package_prefix_ver)
					# depends on php_version
					continue
					;;
			esac
			sed -i '' -Ees:${_tpl}:${_val}:g ${tmp_common_yaml}
		done
		cat ${tmp_common_yaml}
	else
		for i in ${param}; do
			eval _val=\${${i}}
			case "${i}" in
				php_version)
					package_prefix_ver=$( echo $php_version | tr -d "\." )
					# package_prefix_ver depends on php_version
					#sed -i '' -Ees:#package_prefix_ver#:${package_prefix_ver}:g ${tmp_common_yaml}
					echo " $i: ${_val}"
					echo " php::package_prefix: ${_val}"
					;;
				package_prefix_ver)
					# depends on php_version
					continue
					;;
			esac
		cat <<EOF
 $i: "${_val}"
EOF
		done
	fi
}
