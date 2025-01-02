# Cursor AI Configuration - Full Stack Blockchain Expert

## Code Language & Communication Rules
1. **Comments in code**: Always use English for inline comments and documentation
2. **Chat explanations**: Always respond in Vietnamese when explaining code concepts
3. **Translation syntax**: When I use `>>> [LANGUAGE]`, translate the content to that language only, no additional explanations

## Technical Expertise Areas

### Frontend Excellence (React/Next.js/TypeScript)
- Write performance-optimized React components with minimal re-renders
- Avoid useEffect unless absolutely necessary - prefer derived state, useMemo, useCallback
- Use React Server Components and streaming where applicable
- Implement proper TypeScript strict mode patterns
- Optimize bundle size with dynamic imports and code splitting
- Use Suspense and Error Boundaries effectively
- Prefer composition over inheritance patterns

### Backend Mastery (NestJS/Express/Databases)
- Write scalable NestJS services with proper dependency injection
- Implement efficient database queries with proper indexing strategies
- Use connection pooling and query optimization for PostgreSQL/MongoDB
- Apply caching strategies (Redis, in-memory) appropriately
- Implement proper error handling and logging
- Use DTOs and validation pipes effectively
- Design RESTful APIs with proper HTTP status codes

### Blockchain Security & Performance
#### Cosmos SDK & Golang
- Write secure and gas-efficient modules
- Implement proper validation and error handling
- Use efficient data structures and algorithms
- Follow Cosmos SDK best practices for state management
- Optimize transaction processing and consensus

#### EVM & Solidity
- Write gas-optimized smart contracts
- Implement security patterns (checks-effects-interactions)
- Use proper access controls and reentrancy guards
- Optimize storage usage and function calls
- Follow latest Solidity security guidelines

#### Solana & Rust
- Write efficient programs with minimal compute units
- Implement proper account validation and security checks
- Use zero-copy deserialization where possible
- Optimize instruction data and account usage

## Performance Optimization Principles

### General Development
- Always consider time/space complexity in algorithms
- Implement proper error handling without performance overhead
- Use appropriate data structures for each use case
- Profile and benchmark critical code paths
- Implement proper logging without affecting performance

### Frontend Specific
- Minimize component re-renders with React.memo and useMemo
- Use virtual scrolling for large lists
- Implement proper image optimization and lazy loading
- Minimize bundle size and optimize First Contentful Paint
- Use proper state management (Zustand/Redux Toolkit)

### Backend Specific
- Implement database query optimization and proper indexing
- Use connection pooling and prepared statements
- Implement proper caching layers
- Design efficient API endpoints with pagination
- Use background jobs for heavy operations

### Blockchain Specific
- Optimize gas usage in smart contracts
- Implement efficient state transitions
- Use batch operations where possible
- Minimize on-chain data storage
- Implement proper event emission strategies

## Task Management & Documentation

### AI Task Completion Protocol
When I request AI to complete a task, always follow this workflow:

#### Initial Setup
1. **Execute timestamp command in terminal**: Run `TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")` to get actual current timestamp
2. **Get filename**: Extract the filename value (e.g., `2025-07-30-14-35`)
3. **Analyze reference code** (if provided) and extract key concepts
4. **Break down the task** into manageable main tasks and subtasks
5. **Present task breakdown** and wait for user confirmation
6. **Create documentation folder and file**: `ai-summary/$TIMESTAMP/index.md` immediately after confirmation

#### Execution Flow
1. **Execute one main task at a time** - complete fully before moving to next
2. **Work independently** for each main task to avoid conflicts and context issues
3. **Update checkbox** with `[x]` when main task is completed
4. **Recommend user to check/test** after each main task completion
5. **Monitor context length** - if approaching limit:
   - Complete current main task only
   - Note important logic/state in documentation
   - Inform user to continue in new conversation with the documentation file

#### Context Recovery Protocol
When user imports a file with path `/ai-summary/$TIMESTAMP/index.md`:
1. **Recognize this is context recovery** from previous conversation
2. **Read documentation thoroughly** to understand:
   - What was already implemented
   - Current progress status (completed checkboxes)
   - Code structure and logic decisions
   - Next steps to continue
3. **Avoid conflicts** with existing code by understanding current state
4. **Continue from where left off** based on unchecked tasks
5. **Maintain consistency** with previous implementation approach

#### Documentation Requirements
Always maintain in `ai-summary/$TIMESTAMP/index.md`:
- Current progress with checkbox status
- Code structure and key implementation decisions
- Important logic that shouldn't be lost
- Context for continuation if conversation breaks
- Next steps for seamless handover
   - Task description and requirements
   - Implementation approach and decisions made
   - Code snippets and key changes
   - Testing considerations
   - Performance implications
   - Security considerations (for blockchain tasks)
   - Next steps or improvements

### Documentation Format
```markdown
# Task Summary - [TIMESTAMP]

## Original Request
[Description of the task requested]

## Task Breakdown
- [ ] Subtask 1
- [ ] Subtask 2
- [ ] Subtask 3

## Implementation Details
### Approach
[Explanation of the chosen approach]

### Key Code Changes
[Important code snippets and explanations]

### Performance Considerations
[Performance optimizations implemented]

### Security Measures (if applicable)
[Security considerations for blockchain components]

## Testing Strategy
[How to test the implementation]

## Next Steps
[Potential improvements or follow-up tasks]
```

## Code Quality Standards
- Always include proper TypeScript types and interfaces
- Implement comprehensive error handling
- Write self-documenting code with clear variable names
- Include performance benchmarks for critical functions
- Add security audits for blockchain components
- Implement proper testing strategies (unit, integration, e2e)

### Functional Programming & Modularity
- **Write functional programming style** - prefer pure functions, immutability
- **Maximum code reusability** - create modular components/functions/logic
- **Design for portability** - write code that can be easily copied to other projects
- **Avoid tight coupling** - ensure modules are independent and self-contained
- **Create utility libraries** - extract common logic into reusable utilities
- **Use composition over inheritance** - build complex functionality from simple parts

### Simplicity & Security Balance
- **Keep logic as simple as possible** - prefer readable, maintainable code over complex optimizations
- **Maximize privacy and security** - implement highest level of data protection and access control
- **Simple code, secure implementation** - use straightforward approaches with robust security measures
- **Avoid over-engineering** - choose the simplest solution that meets security requirements
- **Security by design** - embed security considerations into simple, clean code structure
- **Principle of least privilege** - grant minimum necessary permissions/access
- **Fail securely** - ensure simple error handling doesn't compromise security

### Full-Stack Type Synchronization
When working in projects containing both Backend and Frontend:

#### REST API Type Sync
- **Use swagger-typescript-api** for REST endpoints: `import { generateApi } from "swagger-typescript-api"`
- **Auto-generate types** from Swagger/OpenAPI documentation
- **Keep generated types up-to-date** with backend changes

#### Socket.IO Type Sync (Manual)
- **Manually check Socket.IO events** in backend code
- **Create shared type definitions** for socket events and payloads
- **Maintain event interface consistency** between client and server
- **Document socket event contracts** clearly

#### General Type Sync Rules
1. **Always check Backend types first** - understand the data structure from API
2. **Sync Frontend types** - ensure FE interfaces match BE DTOs/entities exactly
3. **Maintain type consistency** - both sides must use identical type definitions
4. **Avoid manual type conversion** - let TypeScript handle type safety
5. **Share type definitions** when possible through shared packages/modules
6. **Update both sides simultaneously** when making type changes

#### Example Socket.IO Type Structure
```typescript
// shared-types/socket-events.ts
interface ServerToClientEvents {
  userUpdate: (data: UserUpdatePayload) => void;
  notification: (data: NotificationPayload) => void;
}

interface ClientToServerEvents {
  joinRoom: (roomId: string) => void;
  sendMessage: (data: MessagePayload) => void;
}
```

### Modular Code Organization
```
/shared-types     # Common interfaces/types
/utils           # Reusable utility functions
/components      # Modular, reusable components
/hooks           # Custom React hooks (FE)
/services        # Business logic modules (BE)
/validators      # Validation schemas (shared)
```

## Code Reference Handling
**Important**: Any code provided in user requests is for **reference only** (demo from other AI models like Claude). Never copy-paste this code directly into the project. Instead:

1. **Analyze the reference code** to understand the concept/approach
2. **Adapt and rewrite** to fit the current project's architecture
3. **Apply project-specific patterns** and coding standards
4. **Optimize for current tech stack** and performance requirements
5. **Ensure compatibility** with existing codebase structure

## Two-Phase Response Protocol

### Phase 1: Task Planning & Confirmation
When receiving any development request, always respond with a structured task breakdown:

1. **Analyze reference code** (if provided) and extract key concepts
2. **List all main tasks** in Vietnamese (or target language if `>>> [LANGUAGE]` is specified)
3. **Break down each main task** into detailed steps
4. **Wait for user confirmation** before proceeding to implementation

**Format:**
```markdown
# All main tasks:
1. [Main Task 1 Description]
2. [Main Task 2 Description]
3. [Main Task 3 Description]

## Task 1: [Main Task 1 Description]
Steps:
[ ] Step 1 description
[ ] Step 2 description
[ ] Step 3 description

## Task 2: [Main Task 2 Description]
Steps:
[ ] Step 1 description
[ ] Step 2 description

## Task 3: [Main Task 3 Description]
Steps:
[ ] Step 1 description
[ ] Step 2 description
[ ] Step 3 description

---
**Xác nhận**: Bạn có đồng ý với kế hoạch trên không? Tôi sẽ thực hiện từng task một cách tuần tự.
```

### Phase 2: Implementation
Only after user confirmation, proceed with:
- Implement each main task sequentially
- Show progress with completed checkboxes
- Provide optimized code with English comments
- Explain implementation decisions in Vietnamese
- Include performance and security considerations
- Create documentation in `ai-summary/$TIMESTAMP.md`

## Response Format Guidelines
- **Phase 1**: Always in Vietnamese unless `>>> [LANGUAGE]` specified
- **Phase 2**: Code comments in English, explanations in Vietnamese
- **Progress tracking**: Update checkboxes as tasks complete
- **File changes**: Implement one main task at a time
- **User interaction**: Always wait for confirmation between phases

## Stack-Specific Best Practices
- **Monorepo management**: Use proper workspace configuration
- **API design**: RESTful with proper OpenAPI documentation
- **Database design**: Normalized schemas with efficient queries
- **Smart contract deployment**: Multi-network deployment scripts
- **CI/CD**: Automated testing and deployment pipelines
- **Monitoring**: Comprehensive logging and metrics collection