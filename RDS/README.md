                 Internet Gateway
                        |
               Public Subnet (AZ-A)
                        |
                    NAT Gateway
                        |
     ------------------------------------------------
     |                                              |
Private Subnet AZ-A                      Private Subnet AZ-B
     |                                              |
     |----------- DB Subnet Group ------------------|
                        |
                PostgreSQL RDS
                 (Multi-AZ ON)
                        |
          Synchronous Standby Instance
                        |
                Read Replica
           (Asynchronous Replica)
