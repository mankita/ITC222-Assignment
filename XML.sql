use MetroAlt
--- creating schema which will be displayed under programmability
Create xml Schema Collection MaintenanceNoteSchemaCollection
AS
'<?xml version="1.0" encoding="utf-8"?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified" 
           targetNamespace="http://www.metroalt.com/maintenancenote" 
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="maintenancenote">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="title" />
        <xs:element name="note">
          <xs:complexType>
            <xs:sequence>
              <xs:element maxOccurs="unbounded" name="p" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
        <xs:element name="followup" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'

--Select * from MaintenanceDetail
Alter table MaintenanceDetail 
Drop column MaintenanceNotes

Alter table MaintenanceDetail
-- Inserting xml value's into column by insert command

Add MaintenanceNotes xml(MaintenanceNoteSchemaCollection)
--select * from MaintenanceDetail
Insert into MaintenanceDetail(
MaintenanceKey, BusServiceKey, EmployeeKey, MaintenanceNotes)
Values(6,1,9,
'<?xml version="1.0" encoding="utf-8"?>
<maintenancenote xmlns="http://www.metroalt.com/maintenancenote">
  <title>A service</title>
<note>
  <p>tires are wearing fast</p>
  <p>I recommend new tires within  5000 miles</p>
</note>
  <followup>Schedule replacement for August 2016</followup>
</maintenancenote>')

Alter table MaintenanceDetail
Add MaintenanceNotes xml(MaintenanceNoteSchemaCollection)

Insert into MaintenanceDetail(
MaintenanceKey, BusServiceKey, EmployeeKey, MaintenanceNotes)
Values(7,2,8,
'<?xml version="1.0" encoding="utf-8"?>
<maintenancenote xmlns="http://www.metroalt.com/maintenancenote">
  <title>B service</title>
<note>
  <p>tires are wearing fast</p>
  <p>I recommend new tires within  5000 miles</p>
</note>
  <followup>Schedule replacement for August 2016</followup>
</maintenancenote>')
 
 --Select command on xml column as titles
Select * from MaintenanceDetail
Select MaintenanceDetailKey, MaintenanceNotes.query('declare namespace mn="http://www.metroalt.com/maintenancenote"; 
//mn:maintenancenote/mn:title') as Titles
From MaintenanceDetail
where MaintenanceKey =7