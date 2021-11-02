.. _datacite-cookbook-minting:

Minting the instrument DOI
~~~~~~~~~~~~~~~~~~~~~~~~~~

`DataCite Fabrica`_ is the web interface to create and manage your
DOIs and metadata.  Your organization needs to be a DataCite member or
work with a DataCite member.  This will provide you with your own DOI
prefix and the credentials to sign in to Fabrica.

There are basically three different options to create a new or update
an existing DOI that we describe in the following.

Create the DOI using the web form
---------------------------------

The most interactive way of creating a DOI is to fill a web formular,
indicating the DOI, the URL of the landingpage, and all of the
metadata values.  It provides useful assistence, such as automated
validation or lookup of external identifiers while entering the
values.  See the `DataCite documentation <Create a DOI via Form_>`_
for detailed instructions.

Create the DOI using file upload
--------------------------------

If you want to create many instrument DOIs, manually entering all the
metadata values separately may become tedious.  There is another web
formular that allows the metadata to be uploaded as a file.  Different
file formats are supported, but the most fine grained control over the
properties and their values is propably achieved using DataCite XML.
See the `DataCite documentation <Create a DOI via File Upload_>`_
for detailed instructions.

Use the DataCite REST API
-------------------------

The process of creating the DOIs can be fully automated using the
DataCite REST API.  The metadata may be feed into the API as JSON or
DataCite XML.  See the `DataCite REST API Guide`_ for details.


.. _DataCite Fabrica: https://doi.datacite.org/
.. _Create a DOI via Form: https://support.datacite.org/docs/fabrica-create-doi-form
.. _Create a DOI via File Upload: https://support.datacite.org/docs/fabrica-create-doi-file-upload
.. _DataCite REST API Guide: https://support.datacite.org/docs/api
