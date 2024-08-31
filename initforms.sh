#!/bin/sh
MYDIR="$( /usr/bin/dirname $0 )"
MYPATH="$( /bin/realpath ${MYDIR} )"
HELPER="php"

: ${distdir="/usr/local/cbsd"}
# MAIN
if [ -z "${workdir}" ]; then
	[ -z "${cbsd_workdir}" ] && . /etc/rc.conf
	[ -z "${cbsd_workdir}" ] && exit 0
	workdir="${cbsd_workdir}"
fi

set -e
. ${distdir}/cbsd.conf
. ${subrdir}/tools.subr
. ${subr}
set +e

MYPATH="${workdir}/formfile"

[ ! -d "${MYPATH}" ] && err 1 "No such ${MYPATH}"
[ -f "${MYPATH}/${HELPER}.sqlite" ] && /bin/rm -f "${MYPATH}/${HELPER}.sqlite"

/usr/local/bin/cbsd ${miscdir}/updatesql ${MYPATH}/${HELPER}.sqlite /usr/local/cbsd/share/forms.schema forms

/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,1,'-','PHP Settings','PHP Settings','PP','',1, 'maxlen=60', 'delimer', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,2,'php_version','php_version: 8.3, 8.3 , ..','3','3','',1, 'maxlen=60', 'select', 'php_version_select', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,3,'expose_php','expose_php: default is Off','2','2','',1, 'maxlen=60', 'radio', 'expose_php_onoff', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,4,'short_open_tag','default is Off','Off','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,5,'realpath_cache_ttl','default is 120','120','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'max_execution_time','default is 30','30','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'max_input_time','default is 60','60','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'memory_limit','default is 128M','128M','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'cli_memory_limit','default is 512M','512M','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'error_reporting','default is E_ALL','E_ALL','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'display_errors','display_errors: default is On','1','1','',1, 'maxlen=60', 'radio', 'display_errors_onoff', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'error_log','default is /var/log/httpd/php.err','/var/log/httpd/php.err','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'post_max_size','default is 8M','8M','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'default_charset','default is UTF-8','UTF-8','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'file_uploads','default is On','On','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'upload_tmp_dir','default is /tmp','/tmp','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'upload_max_filesize','default is 2M','2M','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'date_timezone','default is Europe/Moscow','Europe/Moscow','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'session_save_handler','default is files','files','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'session_save_path','default is /tmp','/tmp','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'opcache_enable','default is 1','1','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'opcache_enable_cli','default is 1','1','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,6,'opcache_memory_consumption','default is 64','64','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,7,'-','PHP-FPM Settings','-','-','',1, 'maxlen=60', 'delimer', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,8,'fpm_user','default is www','www','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,9,'fpm_group','default is www','www','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,10,'pm_max_children','max php-fpm process. default is 8','8','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,11,'log_level','default is error','error','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,12,'fpm_error_log','default is /var/log/php-fpm.log','/var/log/php-fpm.log','','',1, 'maxlen=60', 'inputbox', '', '' );
INSERT INTO forms ( mytable,group_id,order_id,param,desc,def,cur,new,mandatory,attr,type,link,groupname ) VALUES ( 'forms', 1,13,'fpm_listen','/tmp/php-fpm.sock','/tmp/php-fpm.sock','','',1, 'maxlen=60', 'inputbox', '', '' );
COMMIT;
EOF

# Put version
/usr/local/bin/cbsd ${miscdir}/updatesql ${MYPATH}/${HELPER}.sqlite /usr/local/cbsd/share/forms_system.schema system

# onoff
/usr/local/bin/cbsd ${miscdir}/updatesql ${MYPATH}/${HELPER}.sqlite /usr/local/cbsd/share/forms_yesno.schema php_version_select
/usr/local/bin/cbsd ${miscdir}/updatesql ${MYPATH}/${HELPER}.sqlite /usr/local/cbsd/share/forms_yesno.schema expose_php_onoff
/usr/local/bin/cbsd ${miscdir}/updatesql ${MYPATH}/${HELPER}.sqlite /usr/local/cbsd/share/forms_yesno.schema display_errors_onoff

# Put boolean for php_version_select
/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
INSERT INTO php_version_select ( text, order_id ) VALUES ( '8.2', 1 );
INSERT INTO php_version_select ( text, order_id ) VALUES ( '8.3', 2 );
INSERT INTO php_version_select ( text, order_id ) VALUES ( '8.4', 3 );
COMMIT;
EOF

# Put boolean for expose_php_onoff
/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
INSERT INTO expose_php_onoff ( text, order_id ) VALUES ( 'on', 1 );
INSERT INTO expose_php_onoff ( text, order_id ) VALUES ( 'off', 0 );
COMMIT;
EOF

# Put boolean for display_errors_onoff
/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
INSERT INTO display_errors_onoff ( text, order_id ) VALUES ( 'on', 1 );
INSERT INTO display_errors_onoff ( text, order_id ) VALUES ( 'off', 0 );
COMMIT;
EOF


/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
INSERT INTO system ( helpername, version, packages, have_restart ) VALUES ( 'php', '201607', 'lang/php73', '' );
COMMIT;
EOF

# long description
/usr/local/bin/sqlite3 ${MYPATH}/${HELPER}.sqlite << EOF
BEGIN TRANSACTION;
UPDATE system SET longdesc='\
PHP, which stands for "PHP: Hypertext Preprocessor" is a widely-used Open \
Source general-purpose scripting language that is especially suited for \
Web development and can be embedded into HTML.  Its syntax draws upon C, \
Java, and Perl, and is easy to learn.  The main goal of the language is to \
allow web developers to write dynamically generated webpages quickly, but \
you can do much more with PHP. \
';
COMMIT;
EOF
