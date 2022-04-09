global class TrackDTO {
    @AuraEnabled
    public String id;
    @AuraEnabled
    public String spotifyId;
    @AuraEnabled
    public String name;
    @AuraEnabled
    public String imageURL;
    @AuraEnabled
    public Decimal duration;
    @AuraEnabled
    public String artistName;
    @AuraEnabled
    public String albumName;
    @AuraEnabled
    public String albumReleaseDate;
    @AuraEnabled
    public List<ArtistDTO> featArtists;

    global TrackDTO(){

    }

}