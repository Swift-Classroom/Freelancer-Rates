import Testing

struct TaskDailyRateFrom {
    @Test func testdailyRateFromFor60() {
        #expect(dailyRateFrom(hourlyRate: 60) == 480.0)
    }
    
    @Test func testdailyRateFromFor16() async throws {
        #expect(dailyRateFrom(hourlyRate: 16) == 128.0)
    }
    
    @Test func testdailyRateFromFor25() async throws {
        #expect(dailyRateFrom(hourlyRate: 25) == 200.0)
    }
}

struct TaskMonthlyRateFrom {
    @Test func testmonthlyWithWholeResult() async throws {
        #expect(monthlyRateFrom(hourlyRate: 80, withDiscount: 0) == 7040)
    }
    
    @Test func testmonthlyRoundDown() async throws {
        #expect(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5) == 12129)
    }
    
    @Test func testmonthlyRoundUp() async throws {
        #expect(monthlyRateFrom(hourlyRate: 80, withDiscount: 10.5) == 12602)
    }
}

struct TaskWorkdaysIn {
    @Test func testworkdaysInSmallBudget() async throws {
        #expect(workdaysIn(budget: 1000, hourlyRate: 50, withDiscount: 10) == 2.0)
    }
    
    @Test func testworkdaysInMediumBudget() async throws {
        #expect(workdaysIn(budget: 5000, hourlyRate: 60, withDiscount: 10) == 11.0)
    }
    
    @Test func testworkdaysLargebudget() async throws {
        #expect(workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 10) == 43.0)
    }
    
    @Test func testworkdaysShouldRound() async throws {
        #expect(workdaysIn(budget: 20_000, hourlyRate: 80, withDiscount: 11) == 35.0)
    }
    
    @Test func testworkdaysShouldNotRoundToNearstInteger() async throws {
        #expect(workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 1) == 43.0)
    }
}
