﻿CREATE PARTITION SCHEME [PS_TBIMAGENESXDOCUMENTOSDIGITALIZADOS]
    AS PARTITION [PF_TBIMAGENESXDOCUMENTOSDIGITALIZADOS]
    TO ([FG_TBIMAGENESXDOCUMENTOSDIGITALIZADOS_01], [FG_TBIMAGENESXDOCUMENTOSDIGITALIZADOS_02], [FG_TBIMAGENESXDOCUMENTOSDIGITALIZADOS_03]);

