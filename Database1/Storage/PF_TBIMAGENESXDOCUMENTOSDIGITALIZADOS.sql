﻿CREATE PARTITION FUNCTION [PF_TBIMAGENESXDOCUMENTOSDIGITALIZADOS](DATETIME)
    AS RANGE
    FOR VALUES ('01/01/2018 00:00:00', '01/01/2019 00:00:00');

