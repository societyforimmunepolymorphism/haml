import argparse

from lxml import etree
from sys import exc_info

def validate_against_schema(schema_text, xml_text):
    try:
        # Validate XML against Schema.
        schema_tree = etree.XMLSchema(etree.XML(schema_text))
        xml_parser = etree.XMLParser(schema=schema_tree)
        try:
            # Encode the text to avoid encoding warnings
            xml_tree = etree.fromstring(xml_text.encode('utf-8'), xml_parser)
            # If we get this far, the XML has validated successfully.
            return ('Valid')
        except etree.XMLSyntaxError as err:
            return ('Invalid:\n' + str(err))

    except Exception as e:
        print('Unexpected problem during xml validation.')
        print(str(e))
        print(exc_info())
        return (str(e) + '\n' + str(exc_info()))

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-xml", "--xml", help="Path to the XML file", required=True, type=str)
    parser.add_argument("-xsd", "--xsd", help="Path to the XSD Schema file", required=True, type=str)
    args = parser.parse_args()
    return args

def read_file(file_name):
    with open(file_name, 'r') as input_file:
        file_text = input_file.read()
        return file_text

def main():
    args = parse_args()

    xml_text = read_file(file_name=args.xml)
    schema_text = read_file(file_name=args.xsd)

    validation_results = validate_against_schema(schema_text=schema_text
                                                 , xml_text=xml_text)

    print(f'Validation Results:\n{validation_results}')

if __name__ == '__main__':
    main()