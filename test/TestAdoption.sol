
contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 8;

  // Testing the adopt() function
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);

    Assert.equal(returnedId, expectedPetId, "El numero es el esperado.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "El dueño de la mascota esperada debe ser este contrato.");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "El dueño de la mascota esperada debe ser este contrato.");
  }
 
  //The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

}
 