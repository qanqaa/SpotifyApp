public class SpotifyArtistDetails {

    public External_urls external_urls;
    public Followers followers;
    public List<String> genres;
    public String href;
    public String id;
    public List<Images> images;
    public String name;
    public Integer popularity;
    public String type;
    public String uri;

    public class Images {
        public Integer height;
        public String url;
        public Integer width;
    }

    public class Followers {
        public Object href;
        public Integer total;
    }

    public class External_urls {
        public String spotify;
    }


    public static SpotifyArtistDetails parse(String json) {
        return (SpotifyArtistDetails) System.JSON.deserialize(json, SpotifyArtistDetails.class);
    }
}