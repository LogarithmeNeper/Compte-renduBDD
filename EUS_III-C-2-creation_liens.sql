--Creation des liens
--BDCentrale :

    create DATABASE link linkToDBCentrale
    connect to aouldhamou
    identified by mdporacle781227
    using 'DB11';

--BDEuropeNord :
    
    create DATABASE link linkToDBEN
    connect to aouldhamou
    identified by MDPORACLE
    using 'DB12';    
    
--BDAmerique :
    
    create DATABASE link linkToDBA
    connect to aouldhamou
    identified by MDPORACLE
    using 'DB14';

