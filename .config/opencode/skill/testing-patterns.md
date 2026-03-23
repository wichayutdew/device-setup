---
description: >-
  Functional testing patterns and best practices. Reference for writing
  effective, immutable tests with when/should/in structure.
trigger: test|testing|kotest|scalatest|jest|unit test|mock
---

# Functional Testing Patterns

Quick reference for writing effective, immutable tests.

## Test Structure

### Hierarchy: when/should/in

```
"Feature" when {
  "action or context" should {
    "expected behavior" in {
      // given - immutable setup
      // when - pure function call
      // then - assertion
    }
  }
}
```

### Inside Each Test: given/when/then

```kotlin
"calculate total" should {
    "sum all item prices" in {
        // given - setup (immutable)
        val items = listOf(Item(price = 10), Item(price = 20))
        
        // when - action (pure function)
        val result = calculateTotal(items)
        
        // then - assertion
        result shouldBe 30
    }
}
```

## Immutable Test Fixtures

### Kotlin
```kotlin
class UserServiceTest : WordSpec({
    // Immutable fixtures - defined once, never mutated
    val testUser = User(id = 1, name = "John", email = "john@test.com")
    val testUsers = listOf(testUser, User(id = 2, name = "Jane"))

    "UserService" when {
        "getUser" should {
            "return user when found" {
                // Use copy for variations
                val activeUser = testUser.copy(active = true)
                // ...
            }
        }
    }
})
```

### Scala
```scala
class UserServiceSpec extends AnyWordSpec with Matchers {
  // Immutable fixtures
  val testUser = User(id = 1, name = "John", email = "john@test.com")
  val testUsers = Seq(testUser, User(id = 2, name = "Jane"))

  "UserService" when {
    "getUser" should {
      "return user when found" in {
        // Use copy for variations
        val activeUser = testUser.copy(active = true)
        // ...
      }
    }
  }
}
```

### TypeScript
```typescript
// Immutable fixtures with const assertion
const TEST_USER = { id: 1, name: 'John', email: 'john@test.com' } as const;
const TEST_USERS: readonly User[] = [TEST_USER, { id: 2, name: 'Jane' }] as const;

describe('UserService', () => {
  describe('when getUser', () => {
    it('should return user when found', () => {
      // Use spread for variations
      const activeUser = { ...TEST_USER, active: true };
      // ...
    });
  });
});
```

## Testing Pure Functions

Pure functions are easiest to test - same input always gives same output.

### Kotlin
```kotlin
"CsvGenerator" when {
    "escapeCsv" should {
        "escape commas" {
            escapeCsv("hello, world") shouldBe "\"hello, world\""
        }
        
        "escape quotes" {
            escapeCsv("say \"hello\"") shouldBe "\"say \"\"hello\"\"\""
        }
        
        "return unchanged when no special chars" {
            escapeCsv("simple") shouldBe "simple"
        }
    }
}
```

### Parameterized Tests (Table-Driven)

```kotlin
"escapeCsv" should {
    withData(
        nameFn = { "escape '${it.first}' to '${it.second}'" },
        "hello, world" to "\"hello, world\"",
        "say \"hi\"" to "\"say \"\"hi\"\"\"",
        "simple" to "simple",
        "" to ""
    ) { (input, expected) ->
        escapeCsv(input) shouldBe expected
    }
}
```

## Testing Result/Either Types

### Kotlin (Result)
```kotlin
"parseEmail" should {
    "return Success for valid email" {
        val result = parseEmail("user@test.com")
        
        result.shouldBeSuccess()
        result.getOrThrow().domain shouldBe "test.com"
    }
    
    "return Failure for invalid email" {
        val result = parseEmail("invalid")
        
        result.shouldBeFailure()
        result.exceptionOrNull() shouldBe instanceOf<ValidationError>()
    }
}
```

### Scala (Either)
```scala
"parseEmail" should {
  "return Right for valid email" in {
    val result = parseEmail("user@test.com")
    
    result.isRight shouldBe true
    result.value.domain shouldBe "test.com"
  }
  
  "return Left for invalid email" in {
    val result = parseEmail("invalid")
    
    result.isLeft shouldBe true
    result.left.value shouldBe a[ValidationError]
  }
}
```

### TypeScript (Discriminated Union)
```typescript
describe('parseEmail', () => {
  it('should return success for valid email', () => {
    const result = parseEmail('user@test.com');
    
    expect(result.type).toBe('success');
    if (result.type === 'success') {
      expect(result.data.domain).toBe('test.com');
    }
  });
  
  it('should return failure for invalid email', () => {
    const result = parseEmail('invalid');
    
    expect(result.type).toBe('failure');
  });
});
```

## Mocking for FP

### Mock at Boundaries Only

```kotlin
// ✅ DO: Mock external dependencies (repositories, APIs)
val userRepository = mockk<UserRepository>()
every { userRepository.findAll() } returns testUsers

// ❌ DON'T: Mock pure functions
// They're deterministic - just call them!
```

### Kotlin (MockK)
```kotlin
val repository = mockk<UserRepository>()

// Setup
coEvery { repository.findById(1) } returns testUser
coEvery { repository.findById(999) } returns null

// Verify
coVerify { repository.findById(1) }
coVerify(exactly = 0) { repository.save(any()) }

// Clear between tests
afterTest { clearMocks(repository) }
```

### Scala (Mockito)
```scala
val repository = mock[UserRepository]

// Setup
when(repository.findById(1)).thenReturn(Future.successful(Some(testUser)))
when(repository.findById(999)).thenReturn(Future.successful(None))

// Verify
verify(repository).findById(1)
verify(repository, never).save(any[User])
```

### TypeScript (Jest)
```typescript
const mockRepository = {
  findById: jest.fn(),
  findAll: jest.fn(),
} as const;

// Setup
mockRepository.findById.mockResolvedValue(TEST_USER);

// Verify
expect(mockRepository.findById).toHaveBeenCalledWith(1);

// Clear
beforeEach(() => jest.clearAllMocks());
```

## Testing Async/Effects

### Kotlin Coroutines
```kotlin
"fetchUser" should {
    "return user from API" {
        coEvery { api.getUser(1) } returns testUser
        
        val result = runBlocking { service.fetchUser(1) }
        
        result shouldBe testUser
    }
}
```

### Scala Future
```scala
"fetchUser" should {
  "return user from API" in {
    when(api.getUser(1)).thenReturn(Future.successful(testUser))
    
    val result = service.fetchUser(1).futureValue
    
    result shouldBe testUser
  }
}
```

### TypeScript Async
```typescript
describe('fetchUser', () => {
  it('should return user from API', async () => {
    mockApi.getUser.mockResolvedValue(TEST_USER);
    
    const result = await service.fetchUser(1);
    
    expect(result).toEqual(TEST_USER);
  });
});
```

## React Testing (Functional Components)

```typescript
describe('UserList', () => {
  // Immutable test data
  const users: readonly User[] = [
    { id: 1, name: 'John' },
    { id: 2, name: 'Jane' },
  ] as const;

  describe('when rendering', () => {
    it('should display all users', async () => {
      // given
      mockUseUsers.mockReturnValue({ users, loading: false });

      // when
      render(<UserList />);

      // then
      expect(screen.getByText('John')).toBeInTheDocument();
      expect(screen.getByText('Jane')).toBeInTheDocument();
    });
  });

  describe('when user clicks delete', () => {
    it('should call onDelete with user id', async () => {
      // given
      const onDelete = jest.fn();
      const user = userEvent.setup();
      render(<UserItem user={users[0]} onDelete={onDelete} />);

      // when
      await user.click(screen.getByRole('button', { name: /delete/i }));

      // then
      expect(onDelete).toHaveBeenCalledWith(1);
    });
  });
});
```

## Test Organization

```
src/test/
├── kotlin/com/example/
│   ├── domain/           # Pure function tests
│   │   └── CsvGeneratorTest.kt
│   ├── service/          # Service tests (with mocks)
│   │   └── UserServiceTest.kt
│   └── integration/      # Full integration tests
│       └── UserApiTest.kt
```

## Checklist

```
Structure:
□ when/should/in hierarchy
□ given/when/then in each test
□ Descriptive test names

Immutability:
□ Test fixtures are val/const
□ No shared mutable state
□ Use copy/spread for variations

Functional:
□ Pure functions tested directly
□ Mocks only at boundaries
□ Result/Either types tested for both cases
```

## Run Commands

```bash
# Kotlin/Java (Gradle)
./gradlew test
./gradlew test --tests "UserServiceTest"

# Scala (SBT)
sbt test
sbt "testOnly *UserServiceSpec"

# TypeScript
npm test
npm test -- --testPathPattern="UserService"
```
