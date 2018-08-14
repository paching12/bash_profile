
#	Variables de entorno

export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

#	Composer
export PATH=$HOME/.composer/vendor/bin:$PATH

#	php
export PATH=/usr/local/php5/bin:$PATH

#	mysql
export PATH=/usr/local/mysql/bin:$PATH

#export ANDROID_HOME=/Users/josepach/Library/Android/sdk
#JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home

#	Mensaje de bienvenida
clear


#	Dibujo 
cat << "EOF"
					¡Bienvenido!
				 ╦┌─┐┌─┐┌─┐  ╔═╗┌─┐┌─┐┬ ┬
				 ║│ │└─┐├┤   ╠═╝├─┤│  ├─┤
				╚╝└─┘└─┘└─┘  ╩  ┴ ┴└─┘┴ ┴ 
EOF


#	Funciones


#	Apache
function start()	{
	sudo /usr/sbin/apachectl start
}	#end 

function restart()	{
	sudo /usr/sbin/apachectl restart
}	#end restart

#	WorkFlow
function adminGOD()	{
	ssh -i ~/.ssh/Certificados/GOD/GrupoOprimaxDev.pem admin@13.56.205.249
}	#end function

function adminGodProd()	{
	ssh -i /Users/josepach/.ssh/Certificados/GOD/GrupoOprimaxCodeman.pem codeman@13.56.43.45
}	#end function

function adminTest()	{
	ssh -i ~/.ssh/Certificados/test/Codeman.pem admin@server.codeman.company
}	#end function

function sftpTest()
{
	sftp -i ~/.ssh/Certificados/test/Codeman.pem admin@server.codeman.company
}	#end sftpTest

function adminINP()
{
	ssh -i ~/.ssh/Certificados/production/INP.pem admin@familiayadicciones.org.mx
}	#end sftpINP

function sftpINP()
{
	sftp -i ~/.ssh/Certificados/production/INP.pem admin@familiayadicciones.org.mx
}	#end sftpINP

#	🔥IONIC🔥

function proyectos()
{
	cd ~/proyectos
	echo 1;
}	#end proyectos 
function rutaProyectos()
{
	echo "/Users/codeman/proyectos"
}	#end proyectos 
function ionic-page()
{
	#	++++++++++++++++++++++++++++++++++++++++++++++	#
	#						Objetivo
	#	**********************************************	#
	#	*La siguiente función tiene como objetivo	 *
	#	*colocar la estructura base de Codeman		 *				
	#	*en el proyecto de ionic.					 *	
	#	**********************************************	#
	#	dir_zip name_proyect name_page option
	# $1	$2	$3	$4
	#	proyect search pages

	if (( $# < 3 )); then
	# TODO: print usage
		BLUE='\033[1;34m'
		GRAY='\033[0;37m'
		BROWN='\033[0;33m'
		GREEN='\033[1;32m'
		NC='\033[0m' # No Color
		echo -e "Parámetros incompletos:"
		printf "${GREEN}***************************************************\n"
		printf "${GREEN}*${GRAY}ionic-page dir_zip name_proyect name_page option ${GREEN}*\n"
		printf "${GREEN}***************************************************\n${NC}"
		printf "${GRAY}(option: app folder o dashboard folder)\n${NC}"
		return 1
	fi
	local res=$(proyectos)
		if [ $res -eq 1 ]; then
			local absolutePath=$(rutaProyectos)
			proyect=$absolutePath
			#		Elijo el tipo de página
			if [[ $4 == "a" ]]; then
				proyect="$proyect/$2/src/pages/app"
			else
				proyect="$proyect/$2/src/pages/dashboard"
			fi

			#	Obtendo el nombre del archivo
			fileName=$(basename $1)
			fileName=$(echo "$fileName" | cut -f 1 -d '.')
			path1="$proyect/$3" #	nueva ruta
			path2="$proyect/$fileName"
			#	echo "$path2 a $path1";	

			absolutePath=$path1
			#	Si no existe ya la página
			if [ ! -d "$absolutePath" ]; then
			#	Unzipeo y muevo los archivos a una nueva carpeta con el nombre de la página
			unzip $1 -d $proyect
			#	Renombro la carpeta
			mv $path2 $path1
			if [ -d "$absolutePath" ]; then
				#	Si existe, itero el directorio
				
				for i in $absolutePath/*;
				do
					newFile="${i/base/$3}"
					mv $i $newFile	
					if [ -f $newFile ]; then
				
				#	En MAC'OS se necesitan '' en linux se remplaza por -e
				
				sed -i '' "s/base/$3/g;s/Base/$3/" $newFile 
			fi	
		done
		clear
		printf "${GREEN}\t\t¡EXITO! 👍 \n${NC}"

		else 
			echo "No existe el directorio $absolutePath"
		fi
	else
			echo "Ya existe la página"
	fi
	fi
}	#end ionic_component

function delete_files()	{
	find . -name '.DS_Store' -type f -delete
}	#end delete_files
