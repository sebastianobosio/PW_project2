from datetime import *
plates = [['OX726SN']]
i = 0
revision_date = datetime.strptime('2022-10-12', '%Y-%m-%d')
outcome = 'negative'
motivation = "Veicolo considerato non sicuro per l'uso su strada"
motivation = None

# Prepare the motivation part, handle escaping single quotes and NULL values
if motivation is None:
    motivation_value = 'NULL'
else:
    motivation_value = f"'{motivation.replace('\'', '\'\'')}'"

# Create the SQL statement
sql = (
    f"INSERT INTO Revisions (plateNumber, revisionDate, outcome, motivation) VALUES ("
    f"'{plates[i][0]}', "
    f"'{revision_date.strftime('%Y-%m-%d')}', "
    f"'{outcome}', "
    f"{motivation_value});"
)

print(sql)

