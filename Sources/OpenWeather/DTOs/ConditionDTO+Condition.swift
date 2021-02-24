import Foundation

extension ConditionDTO {

    init(condition: Condition) {
        let iconURL = Condition.iconBaseURL.appendingPathComponent("\(condition.icon)@2x.png")

        self.init(id: condition.id, main: condition.main, description: condition.description, iconURL: iconURL)
    }

}
