public class SpotifyArtistsResponse {

    public Artists artists {get;set;}

    public SpotifyArtistsResponse(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'artists') {
                        artists = new Artists(parser);
                    } else {
                        System.debug(LoggingLevel.WARN, 'SpotifyArtistsResponse consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }

    public class Images {
        public Integer height {get;set;}
        public String url {get;set;}
        public Integer width {get;set;}

        public Images(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'height') {
                            height = parser.getIntegerValue();
                        } else if (text == 'url') {
                            url = parser.getText();
                        } else if (text == 'width') {
                            width = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Images consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Items {
        public External_urls external_urls {get;set;}
        public Followers followers {get;set;}
        public List<String> genres {get;set;}
        public String href {get;set;}
        public String id {get;set;}
        public List<Images> images {get;set;}
        public String name {get;set;}
        public Integer popularity {get;set;}
        public String type {get;set;}
        public String uri {get;set;}

        public Items(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'external_urls') {
                            external_urls = new External_urls(parser);
                        } else if (text == 'followers') {
                            followers = new Followers(parser);
                        } else if (text == 'genres') {
                            genres = arrayOfString(parser);
                        } else if (text == 'href') {
                            href = parser.getText();
                        } else if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'images') {
                            images = arrayOfImages(parser);
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'popularity') {
                            popularity = parser.getIntegerValue();
                        } else if (text == 'type') {
                            type = parser.getText();
                        } else if (text == 'uri') {
                            uri = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Items consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Followers {
        public Object href {get;set;}
        public Integer total {get;set;}

        public Followers(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'href') {
                            href = parser.readValueAs(Object.class);
                        } else if (text == 'total') {
                            total = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Followers consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class External_urls {
        public String spotify {get;set;}

        public External_urls(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'spotify') {
                            spotify = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'External_urls consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Artists {
        public String href {get;set;}
        public List<Items> items {get;set;}
        public Integer limit_Z {get;set;} // in json: limit
        public String next {get;set;}
        public Integer offset {get;set;}
        public Object previous {get;set;}
        public Integer total {get;set;}

        public Artists(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'href') {
                            href = parser.getText();
                        } else if (text == 'items') {
                            items = arrayOfItems(parser);
                        } else if (text == 'limit') {
                            limit_Z = parser.getIntegerValue();
                        } else if (text == 'next') {
                            next = parser.getText();
                        } else if (text == 'offset') {
                            offset = parser.getIntegerValue();
                        } else if (text == 'previous') {
                            previous = parser.readValueAs(Object.class);
                        } else if (text == 'total') {
                            total = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Artists consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }


    public static SpotifyArtistsResponse parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new SpotifyArtistsResponse(parser);
    }

    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT ||
                    curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                    curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }


    private static List<Items> arrayOfItems(System.JSONParser p) {
        List<Items> res = new List<Items>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Items(p));
        }
        return res;
    }

    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }

    private static List<Images> arrayOfImages(System.JSONParser p) {
        List<Images> res = new List<Images>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Images(p));
        }
        return res;
    }





}