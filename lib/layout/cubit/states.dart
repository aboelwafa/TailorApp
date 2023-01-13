abstract class TailorStates{}

class TailorInitialStates extends TailorStates{}
class TailorLoadingStates extends TailorStates{}
class TailorSuccessStates extends TailorStates{}
class TailorErrorStates extends TailorStates{}

//change bottom nav bar
class TailorChangeNavBarItemStates extends TailorStates{}

//state get user data
class TailorGetUserDataLoadingStates extends TailorStates{}
class TailorGetUserDataSuccessStates extends TailorStates{}
class TailorGetUserDataErrorStates extends TailorStates{}

//state for createProduct
class TailorCreateProductLoadingStates extends TailorStates{}
class TailorCreateProductSuccessStates extends TailorStates{}
class TailorCreateProductErrorStates extends TailorStates{}

//state for image

class TailorCreateImageProductLoadingStates extends TailorStates{}
class TailorCreateImageProductSuccessStates extends TailorStates{}
class TailorCreateImageProductErrorStates extends TailorStates{}

class TailorRemoveImageProductErrorStates extends TailorStates{}

//state for getProduct
class TailorGetProductLoadingStates extends TailorStates{}
class TailorGetProductSuccessStates extends TailorStates{}
class TailorGetProductErrorStates extends TailorStates{}
//state for like product
class TailorProductLikeLoadingState extends TailorStates{}
class TailorProductLikeSuccessState extends TailorStates{}
class TailorProductLikeErrorState extends TailorStates{}

//pageClient

//state for imageClient

class TailorCreateImageClientLoadingStates extends TailorStates{}
class TailorCreateImageClientSuccessStates extends TailorStates{}
class TailorCreateImageClientErrorStates extends TailorStates{}

//state for createClient
class TailorCreateClientLoadingStates extends TailorStates{}
class TailorCreateClientSuccessStates extends TailorStates{}
class TailorCreateClientErrorStates extends TailorStates{}

//state for getClients
class TailorGetClientsLoadingStates extends TailorStates{}
class TailorGetClientsSuccessStates extends TailorStates{}
class TailorGetClientsErrorStates extends TailorStates{}

//state for updateClients
class TailorUpdateClientsLoadingStates extends TailorStates{}
class TailorUpdateClientsSuccessStates extends TailorStates{}
class TailorUpdateClientsErrorStates extends TailorStates{


}
//state for send comment


class TailorSendMessageSuccessStates extends TailorStates{}
class TailorSendMessageErrorStates extends TailorStates{}



