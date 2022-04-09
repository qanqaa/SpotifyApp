global class ArtistDTO {
    @AuraEnabled
    public String id;
    @AuraEnabled
    public String spotifyId;
    @AuraEnabled
    public String name;
    @AuraEnabled
    public String imageURL;
    @AuraEnabled
    public Integer followers;
    @AuraEnabled
    public String genre;
    @AuraEnabled
    public List<String> genres;
    @AuraEnabled
    public Integer popularity;

    global ArtistDTO(){

    }

}