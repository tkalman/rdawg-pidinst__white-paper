When to create a new PID?
=========================

Instruments can be changed or modified over time. For example, when a
component is changed or an instrument is upgraded to meet new
requirements in measurement capability. Defining the exact moment when a
new PID should be created is challenging because different stakeholders
will have different reasons for each evolution. Indeed the PIDINST WG
has not been able to settle on a definitive answer. Thus to accommodate
varying stakeholder needs, it is recommended that a PID will evolve when
there is a significant change in context that is important to an
institutional instrument provider. Significant changes might include
when an instrument is cited in the literature and changes, there is a
need to preserve the instrument history, major changes in measurement
capability that affect automated workflows such as quality control, or
modifications to an instrument’s firmware etc. Whatever the reason an
institution chooses to create new PIDs, it is recommended that
instrument providers identify the succession in the PIDINST metadata
schema using the *relatedIdentifier* property with a *relationType*
attribute *IsNewVersionOf* for the new PID and, *IsPreviousVersionOf*
for the superceded PID as shown in Snippet 8.1 and 8.2.

(1)

.. code-block:: XML

      <relatedIdentifiers>
         <relatedIdentifier relatedIdentifierType="DOI" relationType="IsNewVersionOf">10.4232/10.CPoS-2013-02en</relatedIdentifier>
      </relatedIdentifiers>



(2)

.. code-block:: XML

      <relatedIdentifiers>
         <relatedIdentifier relatedIdentifierType="DOI" relationType="IsPreviousVersionOf">http://hdl.handle.net/21.T11998/0000-001A-3905-F</relatedIdentifier>
      </relatedIdentifiers>


**Snippet 8.1:** The use of the relatedIdentifier property to represent
(1) superseding and (2) superseded PID records in XML



(1)

.. code-block:: JSON

      [{
        "RelatedIdentifier":{
          "RelatedIdentifierValue":"10.4232/10.CPoS-2013-02en",
          "RelatedIdentifierType": "DOI",
          "relationType":"IsNewVersionOf"
        }
      }]


(2)

.. code-block:: JSON

      [{
        "RelatedIdentifier":{
          "RelatedIdentifierValue":"http://hdl.handle.net/21.T11998/0000-001A-3905-F",
          "RelatedIdentifierType": "DOI",
          "relationType":"IsPreviousVersionOf"
        }
      }]



**Snippet 8.2:** The use of the relatedIdentifier property to represent
(1) superseding and (2) superseded PID records in JSON
