Linking instrument PIDs to datasets
===================================

schema.org
----------

Figure 11.1 shows an example of marine dataset
(https://doi.org/10.1594/PANGAEA.887579) published through PANGAEA. The
metadata of the dataset includes descriptive information about the
dataset and its related entities (e.g., scholarly article, project). The
dataset was gathered through sensors attached to an autonomous
underwater vehicle (AWI AUV Polar Autonomous Underwater Laboratory),
which was deployed as part of a cruise campaign (MSM29). The vehicle is
identified through a persistent identifier assigned by
https://sensor.awi.de/. The landing page of the instrument contains
metadata of the instrument such as description, manufacturer, model,
contact, calibration information. Figure 11.2 depicts schema.org types
and properties that may be used to model the dataset’s observation event
(e.g., cruise campaign) and instrument deployed (AUV). Figure 11.3 shows
the snippet of actual schema.org representation. External vocabularies
(NERC SeaVoX Platform Categories and GeoLink Schema) are used to
indicate the additional type for Event and Vehicle. In Schema.org,
‘Event’ refers to an occurrence at a specific time and location, for
example a social event. As such, new types and properties are required
to support the description of observation events and related scientific
instruments to ensure full compliance with Schema.org functionality.

.. image:: /images/image2.png
    :alt: PANGAEA dataset

**Figure 11.1:** An example of a dataset published by PANGAEA which
includes its instrument identifier
(https://doi.pangaea.de/10013/sensor.664525cf-45b9-4969-bb88-91a1c5e97a5b)

.. image:: /images/image1.png
    :alt: Conceptual model

**Figure 11.2:** Conceptual model of Event and Specific Instrument Type
(Vehicle)

.. image:: /images/image3.png
    :alt: Schema.org

**Figure 11.3:** Snippet of schema.org representation of event and
instrument associated with the dataset in Figure 11.1.

.. _section-1:

NetCDF4
-------

State-of-the-art research ships are multimillion-pound floating
laboratories which operate diverse arrays of high-powered,
high-resolution sensors around-the-clock (e.g. sea-floor depth, weather,
ocean current velocity and hydrography etc.). The National Oceanography
Centre (NOC) [17]_ and British Antarctic Survey (BAS) [18]_ are
currently working together to improve the integrity of the data
management workflow from these sensor systems to end-users across the UK
National Environment Research Council (NERC) large research vessel
fleet, as part of a UK initiative, I/Ocean. In doing so, we can make
cost effective use of vessel time while improving the FAIRness [19]_,
and in turn, access of data from these sensor arrays. The initial phase
of the solution implements common NetCDF formats across ships enabling
harmonised access to data for researchers on board while reducing
ambiguity using common metadata standards. The formats are based on
NetCDF4 and comply with Climate Forecast conventions. NetCDF4 groups are
used to include rich information about the instruments used to derive
parameter streams. Data streams are linked to the instruments which
produced them using the variable attribute *instrument* from Attribute
Convention for Data Discovery (ACDD) 1-3 (snippet 11.4). Each instrument
is identified as a group where their properties are expressed in
variables including the instrument’s PID. Each property is defined using
common terminologies published on the NERC Vocabulary Server. In this
way, users can express properties of their choice. Through groups, other
information relating to parameter streams or instruments could be
expressed, such as calibralibrations and instrument reference frames and
orientations.
::
      netcdf iocean_example {
      dimensions:
         INSTANCE = UNLIMITED ; // (1 currently)
         MAXT = 6 ;
      variables:
         float seatemp(INSTANCE, MAXT) ;
            seatemp:_FillValue = -9.f ;
            seatemp:long_name = "sea surface temperature" ;
            seatemp:standard_name = "sea_surface_temperature" ;
            seatemp:units = "degC" ;
            seatemp:sdn_parameter_urn = "SDN:P01::TEMPHU01" ;
            seatemp:sdn_uom_urn = "SDN:P06::UPAA" ;
            seatemp:sdn_parameter_name = "Temperature of the water body by thermosalinograph hull sensor and NO verification against independent measurements" ;
            seatemp:sdn_uom_name = "Degrees Celsius" ;
            seatemp:instrument = "/instruments/SBE_2490" ;

      // global attributes:
            :_NCProperties = "version=2,netcdf=4.7.2,hdf5=1.10.5" ;
      data:

       seatemp =
        7.4809, 7.439, _, 7.403, 7.3647, 7.3497 ;

      group: instruments {
        dimensions:
         NCOLUMNS = 1 ;

        group: SBE_2490 {
          variables:
            string instrument_pid(NCOLUMNS) ;
               instrument_pid:long_name = "PIDINST PID" ;
               instrument_pid:sdn_variable_name = "TBC" ;
               instrument_pid:sdn_variable_url = "TBC" ;
            string uuid(NCOLUMNS) ;
               uuid:long_name = "UUID" ;
               uuid:sdn_variable_name = "Universally Unique Identifier (UUID)" ;
               uuid:sdn_variable_url = "http://vocab.nerc.ac.uk/collection/W07/current/IDEN0007/" ;
            string instrument_name(NCOLUMNS) ;
               instrument_name:long_name = "Instrument name" ;
               instrument_name:sdn_variable_name = "Long name" ;
               instrument_name:sdn_variable_url = "http://vocab.nerc.ac.uk/collection/W07/current/IDEN0002/" ;
            string serial_number(NCOLUMNS) ;
               serial_number:long_name = "Instrument serial number" ;
               serial_number:sdn_variable_name = "Serial Number" ;
               serial_number:sdn_variable_url = "http://vocab.nerc.ac.uk/collection/W07/current/IDEN0005/" ;
            string model_name(NCOLUMNS) ;
               model_name:long_name = "Instrument model name" ;
               model_name:sdn_variable_name = "Model Name" ;
               model_name:sdn_variable_url = "http://vocab.nerc.ac.uk/collection/W06/current/CLSS0002/" ;
            string model_id(NCOLUMNS) ;
               model_id:long_name = "Model Name Identifier" ;
               model_id:sdn_variable_name = "TBC" ;
               model_id:sdn_variable_url = "TBC" ;
            float accuracy_temperature(NCOLUMNS) ;
               accuracy_temperature:long_name = "Instrument accuracy of temperature" ;
               accuracy_temperature:units = "degC" ;
               accuracy_temperature:sdn_variable_name = "Accuracy" ;
               accuracy_temperature:sdn_variable_url = "http://vocab.nerc.ac.uk/collection/W04/current/CAPB0001/" ;
               accuracy_temperature:variable_parameter = "/seatemp" ;
               accuracy_temperature:sdn_uom_url = "http://vocab.nerc.ac.uk/collection/P06/current/UPAA/" ;
               accuracy_temperature:sdn_uom_name = "Degrees Celsius" ;

          // group attributes:
               :date_valid_from = "2020-01-31T00:00:00Z" ;
               :first_use_date = "2020-01-31T00:00:00Z" ;
               :metadata_link = "https://linkedsystems.uk/system/instance/TOOL0022_2490/current/" ;
               :comment = "\n2020-06-26T13:29:42Z: Instrument cleaned on 2020-02-10T13:04:00Z" ;
          data:

           instrument_pid = "http://hdl.handle.net/21.T11998/0000-001A-3905-F" ;

           uuid = "TOOL0022_2490" ;

           instrument_name = "SBE 37-IM MicroCAT s/n 2490" ;

           serial_number = "2490" ;

           model_name = "Sea-Bird SBE 37-IM MicroCAT C-T Sensor" ;

           model_id = "http://vocab.nerc.ac.uk/collection/L22/current/TOOL0022/" ;

           accuracy_temperature = 0.002 ;
          } // group SBE_2490
        } // group instruments
      }


**Snippet 11.4:** Truncated CF-NetCDF4 CDL file. Note some terminologies
are in development.

The National Centres for Environmental Information (NCEI) at the
National Oceanic and Atmospheric Administration (NOAA) in the US, also
report instruments in CF-NetCDF files but as empty data variables within
the root group of the NetCDF file instead of sub groups. The PIDINST
instrument identifier may be expressed as an instrument attribute e.g.
snippet 11.5. Ideally, blank separated lists should be used if linking
more than one instrument.
::
      int instrument_parameter_variable;
         instrument_parameter_variable:long_name = "" ;
         instrument_parameter_variable:comment = "" ;
         instrument_parameter_variable:pidinst_pid = "" ;

**Snippet 11.5:** Addition of a PIDINST PID attribute to NCEI CF-NetCDF
files.

.. [17]
   British Oceanographic Data Centre (BODC) and National Marine
   Facilities (NMF) divisions

.. [18]
   Uk Polar Data Centre division

.. [19]
   Wilkinson, M., Dumontier, M., Aalbersberg, I. *et al.* The FAIR
   Guiding Principles for scientific data management and stewardship.
   *Sci Data* 3, 160018 (2016). https://doi.org/10.1038/sdata.2016.18
