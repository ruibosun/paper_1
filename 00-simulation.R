fake_data<-data.frame(Result=sample(c("Fatal","Resolved"),10000,replace = T), 
                      Gender = sample(c("Male","Female","Unknown"),10000,replace = T),
                      `Sick Days` = round(rnorm(10000,7,2)))
