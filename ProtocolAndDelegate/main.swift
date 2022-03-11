
protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happen")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Checking 30 seconds")
    }
}

class Doctor: AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor is coming")
    }
    
    func useStethescope() {
        print("Listening for heart breaking sound")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by BeeGees")
    }
    
    func useElectricDrill() {
        print("Whriirrr...")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
