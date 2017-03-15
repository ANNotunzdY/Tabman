//
//  TabmanBarTransitionHandler.swift
//  Tabman
//
//  Created by Merrick Sapsford on 14/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit

/// Handler for getting bar/indicator relevant transitions.
internal class TabmanBarTransitionHandler: Any {
    
    //
    // MARK: Properties
    //
    
    private lazy var scrollingIndicatorTransition = TabmanScrollingBarIndicatorTransition()
    private lazy var staticIndicatorTransition = TabmanStaticBarIndicatorTransition()
    
    private lazy var itemColorTransition = TabmanItemColorTransition()
    private lazy var itemMaskTransition = TabmanItemMaskTransition()
    
    //
    // MARK: Transitions
    //
    
    /// Get the transition for the indicator of a particular bar.
    ///
    /// - Parameter bar: The bar.
    /// - Returns: The relevant transition.
    func indicatorTransition(forBar bar: TabmanBar) -> TabmanIndicatorTransition? {
        
        if bar is TabmanScrollingButtonBar {
            
            self.scrollingIndicatorTransition.tabmanBar = bar
            return self.scrollingIndicatorTransition
            
        } else if bar is TabmanPlainBar || bar is TabmanStaticButtonBar {
            
            self.staticIndicatorTransition.tabmanBar = bar
            return self.staticIndicatorTransition
        }
        
        return nil
    }
    
    /// Get the relevant transition for bar items when using a particular indicator style.
    ///
    /// - Parameters:
    ///   - bar: The bar that the indicator is part of.
    ///   - indicatorStyle: The indicator style.
    /// - Returns: The item transition.
    func itemTransition(forBar bar: TabmanBar, indicator: TabmanIndicator) -> TabmanItemTransition? {
        guard let transitionType = indicator.itemTransitionType() else {
            return nil
        }
        
        let transition = transitionType.init()
        transition.tabmanBar = bar
        return transition
    }
}
