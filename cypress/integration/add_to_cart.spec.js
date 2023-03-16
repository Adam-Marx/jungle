describe("Add to cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Adds a product to the cart", () => {

      cy.get(".products article")
        .first()
        .find("form.button_to")
        .submit();

      cy.get('a[href="/cart"]')
        .should('contain', 'My Cart (1)');
  });
});
