Collecting the metadata
~~~~~~~~~~~~~~~~~~~~~~~

For creating a DOI for an instrument, you need to collect all the
metadata that describe the instrument and that you want to register in
the DOI record.  Section :ref:`pidinst-metadata-schema` in the PIDINST
White Paper describes the metadata that you should consider to
include.

The Persistent Identification of Instruments WG has developed a
PIDINST Metadata Schema.  But since you are going to create a DataCite
DOI, you will be constrained to use the `DataCite Metadata Schema`_.
For that purpose, the PIDINST WG has also provided a `Mapping of the
PIDINST Schema onto the DataCite Schema <PIDINST DataCite schema_>`_

Mapping of PIDINST metadata onto DataCite
-----------------------------------------

In the following, we will discuss based on the mapping provided by
PIDINST WG how the metadata describing the instrument can be best
represented in the DataCite Schema:

`Identifier`
  The DOI that you are going to create.  Add as DataCite property
  `Identifier` with `identifierType=DOI`.

`LandingPage`
  The URL of the landing page that the PID resolves to.  The DataCite
  Schema does not have a property for this, but you'll register the
  URL along with the metadata when creating the DOI.

`Name`
  The name by which this instrument is known.  Add as DataCite property
  `Title` with `titleType=Other`.

`Owner`
  The organization or individual that manages the instrument.  Add as
  DataCite property `Contributor` with
  `contributorType=HostingInstitution`.  Consider also to add an
  identifier for the owner in the `nameIdentifier` subproperty of
  `Contributor`.

`Manufacturer`
  The organization or individual that built the instrument.  Add as
  DataCite property `Creator`.  Consider also to add an identifier for
  the manufacturer in the `nameIdentifier` subproperty of `Creator`.

`Model`
  The name of the model or type of the instrument.  Unfortunately, as
  of this writing, the DataCite Schema has no suitable property for
  that, so you'll need to leave it out.\ [#dc_model]_

`Description`
  A textual description of the device and its capabilities.  Add as
  DataCite property `Description` with `descriptionType=Abstract`.

`InstrumentType`
  A classification of the type of the instrument.  There is no
  dedicated property for this in the DataCite Schema, but you may add
  it in the property `Subject`.

`MeasuredVariable`
  The variables or physical properties that the instrument measures or
  observes.  Unfortunately, the DataCite Schema has no suitable
  property for that, so you'll need to leave it out.

`Date`
  Relevant events pertaining to this instrument instance.  Add as
  DataCite property `Date`.  Use `dateType=Available` to indicate the
  date that the instrument is or was in operation.  Use a single date
  if the instrument is still in operation, to indicate a start date.
  Use a date interval to indicate a start and an end date, if the
  instrument has already been decommissioned.

`RelatedIdentifier`
  This can be used to establish links to related resources.  The
  DataCite Schema has a property with the same name, having very
  similar subproperties and semantics as the PIDINST Schema.

`AlternateIdentifier`
  To be used if this instrument is also registered elsewhere.  Add as
  DataCite property `AlternateIdentifier`.  Use
  `alternateIdentifierType=SerialNumber` for a serial number
  attributed by the manufacturer.  Use
  `alternateIdentifierType=InventoryNumber` for an inventory number
  used by the owner.

Additional properties in the DataCite Schema
--------------------------------------------




.. _DataCite Metadata Schema: https://schema.datacite.org/

.. _PIDINST DataCite schema:
   https://github.com/rdawg-pidinst/schema/blob/master/schema-datacite.rst

.. [#dc_model]
   There is a `Proposal to add a Series property <dc_issue72_>`_ to
   the DataCite schema that would be suitable to put the instrument
   model once the proposal is adopted.

.. _dc_issue72: https://github.com/datacite/schema/issues/72
