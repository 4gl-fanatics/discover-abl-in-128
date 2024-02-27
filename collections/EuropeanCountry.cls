
block-level on error undo, throw.

using collections.* from propath.

class collections.EuropeanCountry
    implements ICountry:

    define public property CountryCode as character no-undo
    get.
    private set.

    define public property InEuroZone as logical no-undo
    get.
    private set.

    constructor public EuropeanCountry(pcCode as character, plInEuro as logical):
        this-object:CountryCode = pcCode.
        this-object:InEuroZone = plInEuro.
    end constructor.

    method override public character ToString():
        return "EU-" + this-object:CountryCode.
    end method.

end class.