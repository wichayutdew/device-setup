# Introduction (1min)
- Work experience
    - Backend engineer with 4 years of experience currently at Agoda building
      server-side services in for activities product
    - Explain what is activities (tours, attractions alongside 2 other products
      hotels/flights)
    - Activities supply - starting the server side api to fetch activities data
      from supplier, using tools like kafka
    - Activities booking - handle from booking attempt to post booking handling
      e.g. amendment cancellation
    - Activities marketing - build pricing action service  e.g. discount and
      promotion codes.
    - All are using Scala Kotlin to build either REST, GRPC, GRAPHQL service
- **Background and experience**
    1. Positive: pricing module. Pulling pricing calculation into its own sub
    module since the logic is getting more complicated. Everything went
    smoothly no blocker. Major milestone for personal growth. Considered 1st
    big epic own by me. Note for improvement, scope creep, as I dig further
    into enhancement too early
    2. Positive with some hiccup: multi product promocode. Project that
    requires multi team collab since we’re persuading 2 existing products to
    join, there was multiple back and forth communication dragging the project
    for 3 quarter. Learning opportunity, cross team collaboration and
    stakeholder expectation management
    3. Negative: price breakdown, often got postponed by product from how big
    the change is for this easy feature. Learning opportunities, legacy system
    often posted a major blocker and tech debt which often getting overlooked
- talks about Paidy
    - Admit that arent able to register paidy so looks thru youtube/tiktok and
      see good ui but there’s not much deep dive into each feature. Tried
      download another app suggested e.g. klarna (cannot register as welll no
      otp sent to phone number). But get the basic idea of BNPL service. I also
      belief on providing people with choices, and BNPL service are perfectly
      fits that, cause there are a lot of people who need this kind of product
      but weren’t able to apply for credit card due to multiple reasons, etc.
      and if uses correctly BNPL sometimes gains more benefit than credit card.
- why do you want to join Paidy — Look thru Paidy values
    > We believe in “attacking mendokusai (hassle)” and that technology should
    > be used to improve people’s lives
    This comply with my belief and the reason I entered tech field. Apart from
    inventing something new. for example, Apple,Google. It can also remove
    daily hassles and make people's lives genuinely easier.
- Why should we hire you?
    - I have pretty identical work experience with the job description and
      think it’ll be a good fit. and also wanted to challenge myself with
      another branch of business (I have experience in oil&gas B2B and OTA)
- Why you choose japan
    - I like the nature of preparedness/attention to details of japanese, how
      they always think ahead of something so that others will be most
      convenience. you can see this in everything from product design to
      service. This mindset aligns perfectly with my way of working, always
      considering edge cases and user experience. I believe this cultural
      aspect on quality and preparation is reflected in how Japanese companies
      like Paidy operate. And a plus on how safe it is, how developed, people
      manners, culture itself.

# Scala
- *what's the strength and drawback of Scala?*
    - pros —  combination of FP and OOP, compile time proof rather than run
      time test (when doing sbt build …, circe json serializer), immutability,
      spark and cats (excellent in distributed system), implicit context
      variable making the method signature clean and prevent mutating the
      context variable
    - cons — rather verbose language  and less versatile compared to other
      languages due to small sized community cause of it’s learning curve
- *Are you familiar with functional programming, and if so what are the most
  significant features of them?*
    - How functional programming teach us systematic thinking and workflow.
      the immutability and the Optional feature of it making it less likely to
      leaks unexpected side effect. Also expect the worst to come and handle
      any unexpected behavior prior like what Cats provide.
- *Let’s say you have an API. And a client send a request to it. Then API send
  a response, but client disconnects from the internet and doesn’t receive it.
  What do you do in this situation?*
    1. Idempotency keys - unique request IDs for safe retries can also be rate
    limiter
    2. Timeouts - prevent resource hanging
    3. Async processing - return transaction ID immediately, process either in
    background or message queue
- *How would you approach code reviews for the PR?*
    - 2 rounds to go over, 1 code style, 2 functionalities/test cases
    1. point out to some code that violated either Language’s/ organization
    code style that is not being caught from linter/formatter.
    2. Look into test cases and trying to understand the feature implemented,
    trying to spot possible error or unexpected functionalities. discussed with
    PR owner/ Product team on the fix if the requirement is still vague
- *If some PR has errors, how will you say to developer about that? What will
  you do if developer doesn’t agree with you?*
    - I usually being very open with the idea/suggestion of other, so I often
      expects that from other people. I’ll probably just put a comment and
      discuss on the fix that aligned both of us. If it’s cross team work, I
      tends to respect team who own the system, but anyways if I see
      differently, I still prefer to express that (in a respectful way so we
      can always discuss openly)

# Behavioral
- *What is good leadership?*
    - Providing safe space where team members feel comfortable sharing ideas
      and concerns, while providing clear direction and removing blockers
      preventing the team from delivering the work.
- *What are the qualities of a great engineer?*
    - combines problem-solving skills with communication, always focusing on
      business impact while writing maintainable, scalable code.
- *How do you manage your projects? What do you start with, what do next and so
  on?*
    - I start by clarifying requirements and breaking down work into jira
      stories, then establish clear milestones with regular check-ins(daily
      standup with tech team and weekly check-in with stakeholder if needed)
      and to track progress and adjust scope as needed
- *How do you mentor and teach your teammates? Have you led junior engineers
  and what is mentorship for you?*
    - I mentor through pair programming and code reviews, focusing on
      explaining the 'why' rather than just the 'how,' while allowing junior
      engineers to take ownership once they feel comfortable.
- *Why you are going to leave your current job?*
    - I've really valued my time at Agoda - the collaborative team environment
      and the technical challenges have been rewarding. However, I'm at a point
      in my career where I'm seeking new opportunities, both professionally and
      personally. The fintech space, has a unique technical challenges around
      real-time payment processing and risk assessment. Moving to Japan would
      also allow me to expand my cultural perspective and work in a different
      market environment, which I believe will make me a more well-rounded
      engineer
- Whats the red flag in current team
    - I've been fortunate to work with a really solid team at Agoda. If I had
      to identify areas for improvement, I'd say we could benefit from more
      knowledge sharing and maybe more technical documentation, but these are
      growth opportunities rather than red flags.

# Question to interviewer
- how is tech organization structured, e.g. product team, platform team. Can
  you elaborate further
- What is the tech stack in Paidy(or that certain team) — Scala, AWS, apart
  from that
- Why did you choose to work with Paidy, how’s experience so far, what’s good,
  what’s can be improved in your view
- what’s usual day/sprint at work, how did Paidy handle agile methodologies/
  scrum
- What's been your experience with the team culture and growth opportunities
  here? How do people typically collaborate and support each other's
  development?”
