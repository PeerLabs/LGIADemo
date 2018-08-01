//
//  AccountsAPIController.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor

struct AccountsAPIContrioller: RouteCollection {
	func boot(router: Router) throws {
		let accountsRoute = router.grouped("api", "accounts")
		accountsRoute.get(use: getAllHandler)
		accountsRoute.get(Account.parameter, use: getHandler)
		accountsRoute.get(Account.parameter, "transactions", use: getTransactionsHandler)
		accountsRoute.get(Account.parameter, "balances", use: getBalancesHandler)
		accountsRoute.get(Account.parameter, "assets", use: getAssetAllocationsHandler)
		accountsRoute.get(Account.parameter, "strategies", use: getApportionsHandler)
	}

	func getAllHandler(_ req: Request) throws -> Future<[Account]> {
		return Account.query(on: req).decode(Account.self).all()
	}

	func getHandler(_ req: Request) throws -> Future<Account> {
		return try req.parameters.next(Account.self)
	}

	func getTransactionsHandler(_ req: Request) throws -> Future<[Transaction]> {
		return try req.parameters.next(Account.self).flatMap(to: [Transaction].self) { account in
			return try account.transactions.query(on: req).all()
		}
	}

	func getBalancesHandler(_ req: Request) throws -> Future<[Balance]> {
		return try req.parameters.next(Account.self).flatMap(to: [Balance].self) { account in
			return try account.balances.query(on: req).all()
		}
	}

	func getAssetAllocationsHandler(_ req: Request) throws -> Future<[AssetAllocation]> {
		return try req.parameters.next(Account.self).flatMap(to: [AssetAllocation].self) { account in
			return try account.allocations.query(on: req).all()
		}
	}

	func getApportionsHandler(_ req: Request) throws -> Future<[Apportion]> {
		return try req.parameters.next(Account.self).flatMap(to: [Apportion].self) { account in
			return try account.investmentStrategies.query(on: req).all()
		}
	}

}


