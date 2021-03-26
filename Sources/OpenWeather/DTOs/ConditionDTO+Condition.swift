import Foundation

extension ConditionDTO {

    init(condition: Condition) {
        self.init(id: condition.id, main: condition.main, description: condition.description,
                  iconURL: condition.iconURL)
    }

}
