


#	Variables de entorno

# export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

#	Composer
# export PATH=$HOME/.composer/vendor/bin:$PATH

#	php
# export PATH=/usr/local/php5/bin:$PATH

#	mysql
# export PATH=/usr/local/mysql/bin:$PATH

#export ANDROID_HOME=/Users/josepach/Library/Android/sdk
#JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home

#	Mensaje de bienvenida
clear

BLUE='\033[0;34m'
BLUEL='\033[1;34m'
GRAY='\033[0;37m'
# BROWN='\033[0;33m'
GREENL='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[0;37m'
RED='\033[1;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color


#	Dibujo 
# cat << "EOF"
echo -e	 "				¡Bienvenido!"
echo -e	"		 	 ${BLUE}╦┌─┐┌─┐┌─┐  ${GREENL}╔═╗┌─┐┌─┐┬ ┬"
echo -e	"		 	 ${BLUE}║│ │└─┐├┤   ${GREENL}╠═╝├─┤│  ├─┤${NC}"
echo -e	"			${BLUE}╚╝└─┘└─┘└─┘  ${GREENL}╩  ┴ ┴└─┘┴ ┴${NC}" 
# EOF


#	Funciones


#	Apache
function start()	{
	sudo /usr/sbin/apachectl start
}	#end 

function restart()	{
	sudo /usr/sbin/apachectl restart
}	#end restart

function mysql_start()	{
	brew services start mysql
}	#end mysql

function delete_files()	{
	find . -name '.DS_Store' -type f -delete
}	#end delete_files

function download_git_autocomplete() {	
	RED='\033[0;31m'
	GREEN='\033[0;32m'
	NC='\033[0m' # No Color

	URL=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	echo "${GREEN}Descargando...${NC}"
	wget --tries=2 -P ~/ "${URL}"

	echo "source ~/git-completion.bash" >> ~/.bash_profile
 }	# end autocomplete
 
source ~/git-completion.bash
