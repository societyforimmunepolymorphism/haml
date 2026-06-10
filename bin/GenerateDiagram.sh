XSDVI_PATH="/Users/ben/Desktop/xsdvi/dist/lib/xsdvi.jar"

#SCHEMA_DIR="/Users/ben/github/haml/schemas/0_4_5"
#SCHEMA_FILENAME="haml__version_0_4_5.xsd"

#SCHEMA_DIR="/Users/ben/github/haml/schemas/0_5"
#SCHEMA_FILENAME="haml__version_0_5_0.xsd"

#SCHEMA_DIR="/Users/ben/github/haml/schemas/0_5_1"
#SCHEMA_FILENAME="haml__version_0_5_1.xsd"

#SCHEMA_DIR="/Users/ben/github/haml/schemas/0_5_2"
#SCHEMA_FILENAME="haml__version_0_5_2.xsd"

#SCHEMA_DIR="/Users/ben/github/haml/schemas/0_5_3"
#SCHEMA_FILENAME="haml__version_0_5_3.xsd"

SCHEMA_DIR="/Users/ben/github/haml/schemas/0_6_1"
SCHEMA_FILENAME="haml__version_0_6_1.xsd"


# https://xsdvi.sourceforge.net/
#java -jar xsdvi.jar <input1.xsd> [<input2.xsd> [<input3.xsd> ...]] [style]
#  STYLE:
#    -embodyStyle                css style will be embodied in each svg file, this is default
#    -generateStyle <style.css>  new css file with specified name will be generated and used by svgs
#    -useStyle      <style.css>  external css file at specified url will be used by svgs

cd $SCHEMA_DIR

DIAGRAM_FILENAME=${SCHEMA_FILENAME//".xsd"/".svg"}
DIAGRAM_PATH="$SCHEMA_DIR/$DIAGRAM_FILENAME"
echo "Creating a schema diagram: $DIAGRAM_PATH"
java -jar $XSDVI_PATH $SCHEMA_FILENAME
echo "Done creating a schema diagram: $DIAGRAM_PATH"
