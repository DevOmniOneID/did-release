```mermaid
graph TD
    A[TAS (Trust Anchor Service)]
    B1[Issuer]
    B2[Verifier]
    B3[Wallet Provider]
    B4[User App Provider]
    B5[User (Holder)]
    C[Trust Repository (Blockchain)]
    D1[DID Document]
    D2[Attestation / Credential]
    
    %% TAS 권한 부여 및 등록
    C --> |Attestation| A
    A --> |Register DID Document| C
    A --> |Issue Join Credential| B1
    A --> |Issue Join Credential| B2
    A --> |Issue Join Credential| B3
    A --> |Issue Join Credential| B4
    A --> |Issue Join Credential| B5
    
    %% 엔티티 DID 등록
    B1 --> |Register DID| A
    B2 --> |Register DID| A
    B3 --> |Register DID| A
    B4 --> |Register DID| A
    B5 --> |Register DID| A
    
    %% DID 문서 생성 및 저장
    B1 --> D1
    B2 --> D1
    B3 --> D1
    B4 --> D1
    B5 --> D1
    D1 --> C
    
    %% Credential 발급 및 저장
    B1 --> |Issue VC| B5
    B5 --> D2
    D2 --> C
```
