import tweepy

consumer_key = "weZzP6GKDXTdGwEaxVOjPYNHe";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "1DrNz2wWzhioVCIImRlXL6xD9eWfsuKIqYYV6ibuQwKhuEveob";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "3091270306-CV4H7R5lK87fHKmNjxpMLn0Scj6oRH0G7e7V1IZ";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "NiM3cvpOGKsAi2Eo1dMd2SRKxEMw9acoA81DU28va78rG";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



