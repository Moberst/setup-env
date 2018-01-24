# Enable this to be run from another directory (where the project lives)
SCRIPT_HOME="$HOME/repos/setup-env/tex"
NAME=$1

# Check if directory already exists
if [ -d "$NAME" ]; then
  echo "Error: Directory $NAME exists!"
  exit 1
fi

echo "Creating directory structure"
# Create directory structure
mkdir $NAME
mkdir $NAME/figs
mkdir $NAME/sections

echo "Moving files"
# Move over the files
cp $SCRIPT_HOME/header.tex $SCRIPT_HOME/introduction.tex \
   $SCRIPT_HOME/natbib.sty $SCRIPT_HOME/jmb.bst $SCRIPT_HOME/base.tex \
   $SCRIPT_HOME/base.bib $NAME

# No Makefile, just use vimtex

# Change file names
mv $NAME/base.tex $NAME/$NAME.tex
mv $NAME/base.bib $NAME/$NAME.bib
mv $NAME/introduction.tex $NAME/sections/

sed -i '.bak' 's/\bibliography{base}/\bibliography{'$NAME'}/g' $NAME/$NAME.tex
rm $NAME/$NAME.tex.bak

echo "Initializing Git Repository"
# Initialize git repository
cd $NAME
git init 
