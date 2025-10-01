# **self introduction**
- Backend engineer with 4 years of experience currently at Agoda building
  server-side services in for activities product
- Explain what is activities (tours, attractions alongside 2 other products
  hotels/flights)
- Activities supply - starting the server side api to fetch activities data
  from supplier, using tools like Kafka
- Activities booking - handle from booking attempt to post booking handling
  e.g. amendment cancellation
- Activities marketing - build pricing action service  e.g. discount and
  promotion codes.
- All are using Scala/Kotlin to build either REST, GRPC, GRAPHQL service. But
  also have a bit knowledge in Python, Typescript, Dart.

# Behavioral
***What is good leadership?***
- Providing safe space where team members feel comfortable sharing ideas and
  concerns, while providing clear direction and removing blockers preventing
  the team from delivering the work.

***What are the qualities of a great engineer?***
- combines problem-solving skills with communication, always focusing on
  business impact while writing maintainable, scalable code.

***How do you manage your projects? What do you start with, what do next and so
on?***
- I start by clarifying requirements and breaking down work into jira stories,
  then establish clear milestones with regular check-ins(daily standup with
  tech team and weekly check-in with stakeholder if needed) and to track
  progress and adjust scope as needed

***Why you are going to leave your current job?***
- I've really valued my time at Agoda - the collaborative team environment and
  the technical challenges have been rewarding. However, I'm at a point in my
  career where I'm seeking new opportunities, both professionally and
  personally. Moving to Japan would also allow me to expand my cultural
  perspective and work in a different market environment, which I believe will
  make me a more well-rounded engineer

**Why should we hire you**
- I have pretty identical work experience on JVM and think it’ll be a good fit.
  and also wanted to challenge myself with another branch of business

**what you know about woven - Woven city in Fujisan and opening in Sept.
sustainable city, etc.**
- Mentioned you saw the Woven city on the news for several times and was
  impressed with the launch in CES2025. Mentioned jokingly that you were trying
  to build a smart home but never got time to invest, but now I got a chance to
  build a smart city. so, why hesitate

**motivation on moving to Japan**
- I like the nature of preparedness/attention to details of japanese, how they
  always think ahead of something so that others will be most convenience. you
  can see this in everything from product design to service. This mindset
  aligns perfectly with my way of working, always considering edge cases and
  user experience. And a plus on how safe it is, how developed, people manners,
  culture itself.

***How do you mentor and teach your teammates? Have you led junior engineers
and what is mentorship for you?***
- I mentor through pair programming and code reviews, focusing on explaining
  the 'why' rather than just the 'how,' while allowing junior engineers to take
  ownership once they feel comfortable. And I tends document what’s the useful
  information found during the session, also usually let junior/new joiner
  adjust the contents in documentation and readme so it’s getting improved as
  time goes by

**how important documentation in general**
- Mention current team lacks on documentation and sometimes new comers
  struggles on first few weeks since there’s not enough resource for them to
  study other than asking colleagues. This shows how important documentation is

***How would you approach code reviews for the PR?***
- 2 rounds to go over, 1 code style, 2 functionalities/test cases
1. point out to some code that violated either Language’s/ organization code
style that is not being caught from linter/formatter.
2. Look into test cases and trying to understand the feature implemented,
trying to spot possible error or unexpected functionalities. discussed with PR
owner/ Product team on the fix if the requirement is still vague

***If some PR has errors, how will you say to developer about that? What will
you do if developer doesn’t agree with you?***
- I usually being very open with the idea/suggestion of other, so I often
  expects that from other people. I’ll probably just put a comment and discuss
  on the fix that aligned both of us. If it’s cross team work, I tends to
  respect team who own the system, but anyways if I see differently, I still
  prefer to express that (in a respectful way so we can always discuss openly)

**explain current project, challenges, most proud of**
- multi product promocode. Project that requires multi team collab since we’re
  persuading 2 existing products to join, there was multiple back and forth
  communication dragging the project for 3 quarter. Learning opportunity, cross
  team collaboration and stakeholder expectation management

# Technical
**do you like transitioning to other programming language**
- More comfortable to stick with JVM based language like Java,Scala,Kotlin
  since they all provides most readable code with just enough verbosity. But
  open to other language if needed.

**microservices architecture pros/cons/ diff microservices and monolithic**
- mentioned on microservices/monolithic architecture and repositories. that you
  support microservice architecture and repositories, but monolitic repo have
  thier own benefit.
- pros
    - clear split of responsibility scope
    - easier to manage downtime, only some service is down, etc..
- cons
    - network layer overhead
    - Duplicated ground work

**clean architechture**
- following SOLID principle sometimes go out of the way of SOLID if the
  tradeoff is readability across the entire team

**github actions**
- Have an experience CI/CD and deployment pipeline mostly with Github and
  Gitlab

**kafka pros/cons (compare to other e.g. rabbit mq)**
- pros
    - support high throughput, easily scales
    - easy to integrate with other product from Apache. e.g. Hadoop, Schema
      Registry
    - Message replay, in case the consumer got disconnected or message got lost
- cons
    - more complex to set-up compare to other messaging queue
    - resource intensive and can be very big per broker/topic.

**kubernetes and cloud e.g. aws**
- have knowledge on how kubernetes cluster and pods working and have some
  kubectl/ terraform knowledge.
- Experience in Google Cloud Platform and Microsoft Azure but never have a
  chance to work with AWS since agoda operates on private cloud

**infra related work most proud of and why**
- admit that not been working with infra related task that much as working in
  product team mostly. But mostly being proud of IaaC knowledge to convert yaml
  file into infra setup e.g. Terraform. Also mention on resource utilization
  enhancement with load test and profiling

**sql vs no sql**
- not much different now with the modern technology. So, the decision is mostly
  based off some certain requirement in the project. e.g.
- relational — concerns on ACID compliance e.g. finance application
- key-value store — mostly for caching purpose
- document store — fits evolving data, where the requirement is still
  unfinalized
- column stored  — optimized for Big query

**explain usage with elastic search and Active MQ**
- Don’t have experience with both Elastic search and ActiveMQ but know the
  basic of it.
- Elastic search is a reverse index search to allow user to do text search
  based on the context
- ActiveMQ is another type of messaging queue.

**understanding of rest api**
- tools to allow stateless communication between service/client under HTTP
  layer. REST support GET/POST/PUT/PATCH/DELETE operation to do CRUD logic with
  possibility to add extra calculation logic. about this topic we can later
  extends to discuss about gRPC and GraphQL

***Let’s say you have an API. And a client send a request to it. Then API send
a response, but client disconnects from the internet and doesn’t receive it.
What do you do in this situation?***
1. Idempotency keys - unique request IDs for safe retries can also be rate
limiter
2. Timeouts - prevent resource hanging
3. Async processing - return transaction ID immediately, process either in
background or message queue

## **Q&A**
- how is tech organization structured, e.g. product team, platform team. Can
  you elaborate further
- What is the tech stack on that certain team. Java with something? can you
  explain more about team scope/work scope
- what’s usual day/sprint at work, how did Woven handle agile methodologies/
  scrum
- What's been your experience with the team culture and growth opportunities
  here? How do people typically collaborate and support each other's
  development?
- How’s experience so far, what’s good, what’s can be improved in your view
