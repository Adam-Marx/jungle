describe('Home Page', () => { // Provide a callback function here

  it('loads the home page', () => { // Provide a callback function here

    cy.visit('/')
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})
