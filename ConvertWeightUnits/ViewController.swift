//
//  ViewController.swift
//  ConvertWeightUnits
//
//  Created by Salman Biljeek on 1/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    var weight: Double = 10
    
    var fromUnit: UnitMass = .pounds
    var toUnit: UnitMass = .kilograms
    let decimalPlaces: Int = 2
    
    lazy var fromTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "From value..."
        textField.text = String(describing: weight)
        textField.font = .boldSystemFont(ofSize: 15)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 13
        textField.keyboardType = .decimalPad
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(didUpdateTextField), for: .editingChanged)
        return textField
    }()
    
    lazy var fromButton: UIButton = {
        let configuration: UIButton.Configuration = {
            var config = UIButton.Configuration.filled()
            var container = AttributeContainer()
            container.font = .boldSystemFont(ofSize: 15)
            config.attributedTitle = AttributedString("", attributes: container)
            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
            config.baseBackgroundColor = .label.withAlphaComponent(0.9)
            config.baseForegroundColor = .systemBackground
            config.cornerStyle = .medium
            return config
        }()
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.showsMenuAsPrimaryAction = true
        button.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        button.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        // Menu Items
        let kilogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .kilograms), image: nil, handler: { _ in
            self.fromUnit = .kilograms
            self.updateButtonTitle()
        })
        let gramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .grams), image: nil, handler: { _ in
            self.fromUnit = .grams
            self.updateButtonTitle()
        })
        let decigramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .decigrams), image: nil, handler: { _ in
            self.fromUnit = .decigrams
            self.updateButtonTitle()
        })
        let centigramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .centigrams), image: nil, handler: { _ in
            self.fromUnit = .centigrams
            self.updateButtonTitle()
        })
        let milligramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .milligrams), image: nil, handler: { _ in
            self.fromUnit = .milligrams
            self.updateButtonTitle()
        })
        let microgramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .micrograms), image: nil, handler: { _ in
            self.fromUnit = .micrograms
            self.updateButtonTitle()
        })
        let nanogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .nanograms), image: nil, handler: { _ in
            self.fromUnit = .nanograms
            self.updateButtonTitle()
        })
        let picogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .picograms), image: nil, handler: { _ in
            self.fromUnit = .picograms
            self.updateButtonTitle()
        })
        let ouncesItem = UIAction(title: self.getUnitMassTitle(unitMass: .ounces), image: nil, handler: { _ in
            self.fromUnit = .ounces
            self.updateButtonTitle()
        })
        let poundsItem = UIAction(title: self.getUnitMassTitle(unitMass: .pounds), image: nil, handler: { _ in
            self.fromUnit = .pounds
            self.updateButtonTitle()
        })
        let stonesItem = UIAction(title: self.getUnitMassTitle(unitMass: .stones), image: nil, handler: { _ in
            self.fromUnit = .stones
            self.updateButtonTitle()
        })
        let metricTonsItem = UIAction(title: self.getUnitMassTitle(unitMass: .metricTons), image: nil, handler: { _ in
            self.fromUnit = .metricTons
            self.updateButtonTitle()
        })
        let shortTonsItem = UIAction(title: self.getUnitMassTitle(unitMass: .shortTons), image: nil, handler: { _ in
            self.fromUnit = .shortTons
            self.updateButtonTitle()
        })
        let caratsItem = UIAction(title: self.getUnitMassTitle(unitMass: .carats), image: nil, handler: { _ in
            self.fromUnit = .carats
            self.updateButtonTitle()
        })
        let ouncesTroyItem = UIAction(title: self.getUnitMassTitle(unitMass: .ouncesTroy), image: nil, handler: { _ in
            self.fromUnit = .ouncesTroy
            self.updateButtonTitle()
        })
        let slugsItem = UIAction(title: self.getUnitMassTitle(unitMass: .slugs), image: nil, handler: { _ in
            self.fromUnit = .slugs
            self.updateButtonTitle()
        })
        
        let children: [UIMenuElement] = [
            kilogramsItem,
            gramsItem,
            decigramsItem,
            centigramsItem,
            milligramsItem,
            microgramsItem,
            nanogramsItem,
            picogramsItem,
            ouncesItem,
            poundsItem,
            stonesItem,
            metricTonsItem,
            shortTonsItem,
            caratsItem,
            ouncesTroyItem,
            slugsItem
        ]
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: children)
        button.menu = menu
        return button
    }()
    
    lazy var toButton: UIButton = {
        let configuration: UIButton.Configuration = {
            var config = UIButton.Configuration.filled()
            var container = AttributeContainer()
            container.font = .boldSystemFont(ofSize: 15)
            config.attributedTitle = AttributedString("", attributes: container)
            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
            config.baseBackgroundColor = .systemBackground.withAlphaComponent(0.9)
            config.baseForegroundColor = .label
            config.cornerStyle = .medium
            return config
        }()
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.showsMenuAsPrimaryAction = true
        button.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        button.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        // Menu Items
        let kilogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .kilograms), image: nil, handler: { _ in
            self.toUnit = .kilograms
            self.updateButtonTitle()
        })
        let gramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .grams), image: nil, handler: { _ in
            self.toUnit = .grams
            self.updateButtonTitle()
        })
        let decigramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .decigrams), image: nil, handler: { _ in
            self.toUnit = .decigrams
            self.updateButtonTitle()
        })
        let centigramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .centigrams), image: nil, handler: { _ in
            self.toUnit = .centigrams
            self.updateButtonTitle()
        })
        let milligramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .milligrams), image: nil, handler: { _ in
            self.toUnit = .milligrams
            self.updateButtonTitle()
        })
        let microgramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .micrograms), image: nil, handler: { _ in
            self.toUnit = .micrograms
            self.updateButtonTitle()
        })
        let nanogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .nanograms), image: nil, handler: { _ in
            self.toUnit = .nanograms
            self.updateButtonTitle()
        })
        let picogramsItem = UIAction(title: self.getUnitMassTitle(unitMass: .picograms), image: nil, handler: { _ in
            self.toUnit = .picograms
            self.updateButtonTitle()
        })
        let ouncesItem = UIAction(title: self.getUnitMassTitle(unitMass: .ounces), image: nil, handler: { _ in
            self.toUnit = .ounces
            self.updateButtonTitle()
        })
        let poundsItem = UIAction(title: self.getUnitMassTitle(unitMass: .pounds), image: nil, handler: { _ in
            self.toUnit = .pounds
            self.updateButtonTitle()
        })
        let stonesItem = UIAction(title: self.getUnitMassTitle(unitMass: .stones), image: nil, handler: { _ in
            self.toUnit = .stones
            self.updateButtonTitle()
        })
        let metricTonsItem = UIAction(title: self.getUnitMassTitle(unitMass: .metricTons), image: nil, handler: { _ in
            self.toUnit = .metricTons
            self.updateButtonTitle()
        })
        let shortTonsItem = UIAction(title: self.getUnitMassTitle(unitMass: .shortTons), image: nil, handler: { _ in
            self.toUnit = .shortTons
            self.updateButtonTitle()
        })
        let caratsItem = UIAction(title: self.getUnitMassTitle(unitMass: .carats), image: nil, handler: { _ in
            self.toUnit = .carats
            self.updateButtonTitle()
        })
        let ouncesTroyItem = UIAction(title: self.getUnitMassTitle(unitMass: .ouncesTroy), image: nil, handler: { _ in
            self.toUnit = .ouncesTroy
            self.updateButtonTitle()
        })
        let slugsItem = UIAction(title: self.getUnitMassTitle(unitMass: .slugs), image: nil, handler: { _ in
            self.toUnit = .slugs
            self.updateButtonTitle()
        })
        
        let children: [UIMenuElement] = [
            kilogramsItem,
            gramsItem,
            decigramsItem,
            centigramsItem,
            milligramsItem,
            microgramsItem,
            nanogramsItem,
            picogramsItem,
            ouncesItem,
            poundsItem,
            stonesItem,
            metricTonsItem,
            shortTonsItem,
            caratsItem,
            ouncesTroyItem,
            slugsItem
        ]
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: children)
        button.menu = menu
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .secondarySystemBackground
        label.font = .boldSystemFont(ofSize: 35)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = .boldSystemFont(ofSize: 25)
            label.textColor = .label.withAlphaComponent(0.9)
            label.text = "WEIGHT & MASS CONVERTER"
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.6
            return label
        }()
        
        let titleStack = UIStackView(arrangedSubviews: [
            titleLabel
        ])
        titleStack.isLayoutMarginsRelativeArrangement = true
        titleStack.layoutMargins = .init(top: 0, left: 20, bottom: 20, right: 20)
        
        let fromTextFieldStack = UIStackView(arrangedSubviews: [
            fromTextField
        ])
        fromTextFieldStack.backgroundColor = .systemGray5
        fromTextFieldStack.layer.cornerRadius = 8
        fromTextFieldStack.layer.shadowColor = UIColor.black.cgColor
        fromTextFieldStack.layer.shadowOpacity = 0.3
        fromTextFieldStack.layer.shadowOffset = .zero
        fromTextFieldStack.layer.shadowRadius = 2
        fromTextFieldStack.isLayoutMarginsRelativeArrangement = true
        fromTextFieldStack.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        
        let fromStack = UIStackView(arrangedSubviews: [
            fromTextFieldStack,
            fromButton
        ])
        fromStack.axis = .horizontal
        fromStack.spacing = 10
        fromStack.isLayoutMarginsRelativeArrangement = true
        fromStack.layoutMargins = .init(top: 10, left: 20, bottom: 30, right: 20)
        
        let toStack = UIStackView(arrangedSubviews: [
            label,
            toButton
        ])
        toStack.axis = .horizontal
        toStack.spacing = 10
        
        let bottomStack = UIStackView(arrangedSubviews: [
            toStack,
            UIView()
        ])
        bottomStack.axis = .vertical
        bottomStack.backgroundColor = .label.withAlphaComponent(0.9)
        bottomStack.isLayoutMarginsRelativeArrangement = true
        bottomStack.layoutMargins = .init(top: 20, left: 20, bottom: 10, right: 20)
        
        let mainStack = UIStackView(arrangedSubviews: [
            titleStack,
            fromStack,
            bottomStack
        ])
        mainStack.axis = .vertical
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mainStack)
        mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainStack.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.updateButtonTitle()
    }
    
    fileprivate func convertMassMeasurement(fromUnit: UnitMass, toUnit: UnitMass, value: Double, decimalPlaces: Int) -> Double {
        let measurement = Measurement(value: value, unit: fromUnit)
        let convertedValue = measurement.converted(to: toUnit)
        let roundedValue = self.roundedTo(value: convertedValue.value, decimalPlaces: decimalPlaces)
        return roundedValue
    }
    
    fileprivate func roundedTo(value: Double, decimalPlaces: Int) -> Double {
        var multiplyValueString = String(repeating: "0", count: decimalPlaces)
        multiplyValueString = "1" + multiplyValueString
        let multiplyValue = Double(multiplyValueString) ?? 0
        let roundedValue = (value * multiplyValue).rounded() / multiplyValue
        return roundedValue
    }
    
    fileprivate func getUnitMassSymbol(unitMass: UnitMass, value: Double?) -> String {
        switch unitMass {
        case .kilograms:
            return "kg"
        case .grams:
            return "g"
        case .decigrams:
            return "dg"
        case .centigrams:
            return "cg"
        case .milligrams:
            return "mg"
        case .micrograms:
            return "µg"
        case .nanograms:
            return "ng"
        case .picograms:
            return "pg"
        case .ounces:
            return "oz."
        case .pounds:
            return "lbs"
        case .stones:
            return "st."
        case .metricTons:
            return "t"
        case .shortTons:
            return "tn"
        case .carats:
            return "ct"
        case .ouncesTroy:
            return "oz t."
        case .slugs:
            return (value == 1) ? "slug" : "slugs"
        default:
            return ""
        }
    }
    
    fileprivate func getUnitMassTitle(unitMass: UnitMass) -> String {
        switch unitMass {
        case .kilograms:
            return "Kilograms (kg)"
        case .grams:
            return "Grams (g)"
        case .decigrams:
            return "Decigrams (dg)"
        case .centigrams:
            return "Centigrams (cg)"
        case .milligrams:
            return "Milligrams (mg)"
        case .micrograms:
            return "Micrograms (µg)"
        case .nanograms:
            return "Nanograms (ng)"
        case .picograms:
            return "Picograms (pg)"
        case .ounces:
            return "Ounces (oz.)"
        case .pounds:
            return "Pounds (lbs)"
        case .stones:
            return "Stones (st.)"
        case .metricTons:
            return "Metric Tons (t)"
        case .shortTons:
            return "Short Tons (tn)"
        case .carats:
            return "Carats (ct)"
        case .ouncesTroy:
            return "Ounces Troy (oz t.)"
        case .slugs:
            return "Slugs (slugs)"
        default:
            return ""
        }
    }
    
    fileprivate func updateButtonTitle() {
        let fromTitle = self.getUnitMassTitle(unitMass: self.fromUnit)
        let toTitle = self.getUnitMassTitle(unitMass: self.toUnit)
        fromButton.configuration?.title = fromTitle
        toButton.configuration?.title = toTitle
        self.didUpdateTextField(textField: fromTextField)
    }
    
    @objc fileprivate func didUpdateTextField(textField: UITextField) {
        weight = Double(textField.text ?? "") ?? 0
        
        let convertedWeight = self.convertMassMeasurement(fromUnit: fromUnit, toUnit: toUnit, value: weight, decimalPlaces: decimalPlaces)
        
        let weightNumberformatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.alwaysShowsDecimalSeparator = true
            numberFormatter.minimumFractionDigits = decimalPlaces
            numberFormatter.maximumFractionDigits = decimalPlaces
            return numberFormatter
        }()
        
        let convertedWeightToString = weightNumberformatter.string(from: NSNumber(value: convertedWeight)) ?? ""
        let weightUnitSymbol = self.getUnitMassSymbol(unitMass: toUnit, value: convertedWeight)
        let formattedString = "\(convertedWeightToString) \(weightUnitSymbol)"
        
        label.text = formattedString
    }
}

